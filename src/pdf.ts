// ============================================================
// Generator PDF — port dari code.gs (DocumentApp + DriveApp)
// Pendekatan: buat PDF ASLI di server memakai pdf-lib (berjalan
// di Cloudflare Workers). Hasil: file .pdf beneran dengan tabel
// rapi + page-break otomatis — konsisten dengan tampilan cetak,
// langsung didownload, tanpa ketergantungan browser.
// ============================================================
import { PDFDocument, StandardFonts, rgb, PDFFont, PDFPage } from 'pdf-lib';
import { all } from './lib/db';
import type { D1Database } from '@cloudflare/workers-types';
import { fmtDateID, todayWIB } from './lib/crypto';

// Ukuran A4 (pt) + margin
const PAGE_W = 595.28;
const PAGE_H = 841.89;
const MARGIN = 36;
const CW = PAGE_W - MARGIN * 2;

const BLACK = rgb(0.1, 0.1, 0.1);
const GRAY = rgb(0.38, 0.38, 0.38);
const LGRAY = rgb(0.85, 0.85, 0.85);
const WHITE = rgb(1, 1, 1);
const ROW_ALT = rgb(0.97, 0.97, 0.97);

function esc(v: unknown): string {
  return String(v === null || v === undefined ? '' : v);
}

function fmtN(v: unknown): string {
  return v === '' || v === null || v === undefined ? '-' : String(v);
}

// Pecah teks menjadi baris-baris agar muat di maxWidth (wrap per kata,
// dengan fallback per karakter untuk kata panjang supaya TIDAK pernah
// meluber ke kolom sebelah / tertutup tabel).
function wrapText(text: string, font: PDFFont, size: number, maxWidth: number): string[] {
  const words = String(text).split(/\s+/).filter(Boolean);
  const lines: string[] = [];
  let cur = '';
  const fits = (t: string) => font.widthOfTextAtSize(t, size) <= maxWidth;
  // Kata tunggal lebih lebar dari kolom → pecah per karakter.
  const pushChunks = (word: string): string => {
    if (fits(word)) return word;
    let chunk = '';
    for (const ch of word) {
      if (chunk && !fits(chunk + ch)) { lines.push(chunk); chunk = ch; }
      else chunk += ch;
    }
    return chunk;
  };
  for (const w of words) {
    const t = cur ? cur + ' ' + w : w;
    if (!cur || fits(t)) {
      cur = t;
    } else {
      if (cur) lines.push(cur);
      cur = pushChunks(w);
    }
  }
  if (cur) lines.push(cur);
  return lines.length ? lines : [''];
}

function clamp(v: number, lo: number, hi: number): number {
  return Math.max(lo, Math.min(v, hi));
}

// Lebar kolom cerdas: ukur isi (header + semua sel), beri prioritas kolom
// 'Nama' (agar nama siswa utuh & terlihat), kolom angka/tanggal dibuat
// ramping, lalu kecilkan/gembungkan hingga total selebar targetWidth.
// Header tidak boleh terpotong: tiap kolom minimal selebar header-nya.
// `natural=true` mengembalikan lebar alami (tanpa menyusut/menggembung),
// dipakai untuk memutuskan orientasi halaman (potret/landscape).
function computeColWidths(headers: string[], rows: (string | number)[][], font: PDFFont, size: number, targetWidth: number, natural = false): number[] {
  const n = headers.length;
  const isNo = (i: number) => headers[i] === 'No';
  const isNama = (i: number) => headers[i] === 'Nama';
  const isNis = (i: number) => headers[i] === 'NIS';
  const isDate = (i: number) => /^(\d{1,2}[\/-]\d{1,2})$/.test(headers[i]);
  const isLong = (i: number) => /^(Isi|Materi|Kegiatan|Keterangan)$/.test(headers[i]);
  // Kolom tanggal ramping (header pendek "01-08"), kolom lain lebih lega.
  const colPad = (i: number) => (isDate(i) ? 3 : 5);

  const needed: number[] = [];
  const headerW: number[] = [];
  for (let i = 0; i < n; i++) {
    const hw = font.widthOfTextAtSize(headers[i], size);
    headerW[i] = Math.ceil(hw) + colPad(i) * 2;
    let m = hw;
    for (const r of rows) {
      const t = fmtN(r?.[i]);
      if (t) m = Math.max(m, font.widthOfTextAtSize(t, size));
    }
    needed[i] = Math.ceil(m) + colPad(i) * 2;
  }

  const widths: number[] = needed.map((w, i) => {
    if (isNo(i)) return 26;
    if (isNama(i)) return clamp(w, 90, 200);
    if (isNis(i)) return clamp(w, 42, 60);
    if (isDate(i)) return clamp(w, 24, 34);
    if (isLong(i)) return clamp(w, 80, 320);
    return clamp(w, 24, 44);
  });

  if (natural) return widths;

  let sum = widths.reduce((a, b) => a + b, 0);

  // Terlalu lebar → kecilkan kolom lain dulu; Nama paling terakhir.
  let guard = 0;
  while (sum > targetWidth && guard++ < 200) {
    let best = -1;
    let bestW = 0;
    for (let i = 0; i < n; i++) {
      if (isNo(i) || isNama(i)) continue;
      const minW = Math.max(
        isNis(i) ? 40 : isLong(i) ? 60 : isDate(i) ? 24 : 20,
        headerW[i],
      );
      if (widths[i] > minW && widths[i] > bestW) { best = i; bestW = widths[i]; }
    }
    if (best < 0) {
      for (let i = 0; i < n; i++) {
        if (isNama(i) && widths[i] > 90) { best = i; break; }
      }
      if (best < 0) break;
    }
    widths[best] -= 2;
    sum = widths.reduce((a, b) => a + b, 0);
  }

  // Jaga-jaga: bila masih kepanjangan (mis. jumlah tanggal sangat banyak),
  // perkecil proporsional agar tabel tidak meluber keluar halaman.
  if (sum > targetWidth) {
    const factor = targetWidth / sum;
    for (let i = 0; i < n; i++) {
      if (!isNo(i)) widths[i] = Math.max(isDate(i) ? 14 : 16, Math.floor(widths[i] * factor));
    }
    sum = widths.reduce((a, b) => a + b, 0);
  }

  // Sisa ruang → bagikan agar tabel selebar area cetak.
  // Nama dapat prioritas (agar nama siswa utuh), lalu kolom panjang, sisanya merata.
  if (sum < targetWidth) {
    let extra = Math.floor(targetWidth - sum);
    for (let i = 0; i < n && extra > 0; i++) {
      if (isNama(i)) {
        const add = Math.min(extra, 120, Math.max(0, 240 - widths[i]));
        if (add > 0) { widths[i] += add; extra -= add; }
      }
    }
    const longIdx: number[] = [];
    for (let i = 0; i < n; i++) if (isLong(i)) longIdx.push(i);
    if (longIdx.length && extra > 0) {
      const share = Math.min(120, Math.floor(extra / longIdx.length));
      for (const i of longIdx) {
        const add = Math.min(share, extra);
        widths[i] += add;
        extra -= add;
      }
    }
    let k = 0;
    let g2 = 0;
    const added: number[] = new Array(n).fill(0);
    while (extra > 0 && g2++ < 400) {
      if (!isNo(k % n) && added[k % n] < 40) { widths[k % n]++; added[k % n]++; extra--; }
      k++;
    }
  }
  return widths;
}

// Gambar satu baris teks, kembalikan y baru (bergeser ke atas).
function drawLine(
  page: PDFPage,
  text: string,
  x: number,
  y: number,
  font: PDFFont,
  size: number,
  color = BLACK,
): number {
  page.drawText(text, { x, y, size, font, color });
  return y - size * 1.45;
}

function drawLineCenter(
  page: PDFPage,
  text: string,
  y: number,
  font: PDFFont,
  size: number,
  color = BLACK,
  pageW = PAGE_W,
): number {
  const w = font.widthOfTextAtSize(text, size);
  page.drawText(text, { x: (pageW - w) / 2, y, size, font, color });
  return y - size * 1.45;
}

interface TableOpts {
  headers: string[];
  rows: (string | number)[][];
  font: PDFFont;
  bold: PDFFont;
  size: number;
}

// Apakah tabel perlu halaman landscape? Pakai lebar natural kolom
// (tanpa dipaksa menyusut) sebagai perkiraan kebutuhan ruang sebenarnya.
function tableNeedsLandscape(headers: string[], rows: (string | number)[][], font: PDFFont, size: number): boolean {
  const widths = computeColWidths(headers, rows, font, size, 99999, true);
  return widths.reduce((a, b) => a + b, 0) > CW;
}

// Gambar tabel dengan page-break otomatis (header terulang tiap halaman).
// Ukuran halaman mengikuti `pageW`/`pageH` dari pemanggil (buildPdf sudah
// memutuskan potret/landscape untuk seluruh dokumen).
// Kembalikan { page, y } posisi terakhir.
function drawTable(doc: PDFDocument, page: PDFPage, y: number, opts: TableOpts & { pageW: number; pageH: number; margin: number }): { page: PDFPage; y: number } {
  const { headers, rows, font, bold, size, pageW, pageH, margin } = opts;
  const n = headers.length;
  const lineH = size * 1.45;
  const padY = 5;
  // Kolom tanggal (header pendek "01-08") butuh padding lebih ramping agar
  // banyak kolom tanggal bisa muat; kolom lain lebih lega.
  const isDateCol = (h: string) => /^(\d{1,2}[\/-]\d{1,2})$/.test(h);
  const padX = (i: number) => (isDateCol(headers[i]) ? 3 : 5);

  const cw = pageW - margin * 2;
  const colW = computeColWidths(headers, rows, font, size, cw);
  const tableW = colW.reduce((a, b) => a + b, 0);

  // Pusatkan tabel bila masih ada sisa ruang di kanan.
  const startX = margin + Math.max(0, (cw - tableW) / 2);

  // Rata tengah untuk kolom yang isinya angka/tanggal (bukan teks nama).
  const isCenter = (i: number): boolean => {
    const h = headers[i];
    if (h === 'Nama' || h === 'Isi' || h === 'Materi' || h === 'Kegiatan' || h === 'Keterangan' || h === 'Jam') return false;
    return true;
  };

  // Gambar header tabel.
  const drawHeader = (pg: PDFPage, yy: number): number => {
    const hh = size * 1.45 + padY * 2;
    let x = startX;
    pg.drawRectangle({ x: startX, y: yy - hh, width: tableW, height: hh, color: LGRAY });
    for (let i = 0; i < n; i++) {
      const w = font.widthOfTextAtSize(headers[i], size);
      const cx = isCenter(i) ? x + (colW[i] - w) / 2 : x + padX(i);
      pg.drawText(headers[i], { x: cx, y: yy - size - padY + 1, size, font: bold });
      x += colW[i];
    }
    return yy - hh;
  };

  y = drawHeader(page, y);

  const flushRow = (pg: PDFPage, yy: number, ri: number): number => {
    let x = startX;
    for (let i = 0; i < n; i++) {
      const cell = fmtN(rows[ri]?.[i]);
      const lines = wrapText(cell, font, size, colW[i] - padX(i) * 2);
      pg.drawRectangle({
        x,
        y: yy - rowH,
        width: colW[i],
        height: rowH,
        color: ri % 2 === 1 ? ROW_ALT : WHITE,
        borderColor: rgb(0.72, 0.72, 0.72),
        borderWidth: 0.5,
      });
      let ly = yy - size - padY + 1;
      for (const ln of lines) {
        const w = font.widthOfTextAtSize(ln, size);
        const cx = isCenter(i) ? x + (colW[i] - w) / 2 : x + padX(i);
        pg.drawText(ln, { x: cx, y: ly, size, font });
        ly -= lineH;
      }
      x += colW[i];
    }
    return yy - rowH;
  };

  let rowH = 0;
  for (let ri = 0; ri < rows.length; ri++) {
    let maxLines = 1;
    for (let i = 0; i < n; i++) {
      const cell = fmtN(rows[ri]?.[i]);
      const lines = wrapText(cell, font, size, colW[i] - padX(i) * 2);
      if (lines.length > maxLines) maxLines = lines.length;
    }
    rowH = maxLines * lineH + padY * 2;
    if (y - rowH < margin) {
      page = doc.addPage([pageW, pageH]);
      y = pageH - margin;
      y = drawHeader(page, y);
    }
    y = flushRow(page, y, ri);
  }
  return { page, y };
}

async function waliKelasNama(db: D1Database, kelas: string): Promise<string> {
  try {
    const r = await all(db, "SELECT nama_lengkap AS nama FROM users WHERE role='Walikelas' AND kelas=? LIMIT 1", [kelas]);
    return r[0]?.nama ? String(r[0].nama) : '-';
  } catch {
    return '-';
  }
}

async function getTA(db: D1Database): Promise<{ ta: string; sem: string }> {
  try {
    const ta = await all(db, "SELECT setting_value FROM settings WHERE setting_key='TA_AKTIF'");
    const sm = await all(db, "SELECT setting_value FROM settings WHERE setting_key='SEMESTER'");
    return { ta: ta[0]?.setting_value ? String(ta[0].setting_value) : '2025/2026', sem: sm[0]?.setting_value ? String(sm[0].setting_value) : '1' };
  } catch {
    return { ta: '2025/2026', sem: '1' };
  }
}

interface PdfOpts {
  title: string;
  subtitle?: string;
  kelas?: string;
  sections?: { heading?: string; table?: { headers: string[]; rows: any[][] }; note?: string }[];
  notes?: string[];
}

// Bangun dokumen PDF (layout kop + judul + sections + tabel + catatan).
// Orientasi (potret/landscape) ditentukan dari lebar tabel terlebar di
// sections — seluruh dokumen memakai orientasi yang sama agar kop/judul
// dan tabel berada di halaman yang konsisten.
async function buildPdf(db: D1Database, opts: PdfOpts): Promise<Uint8Array> {
  const ta = await getTA(db);
  const doc = await PDFDocument.create();
  const font = await doc.embedFont(StandardFonts.Helvetica);
  const bold = await doc.embedFont(StandardFonts.HelveticaBold);
  const ital = await doc.embedFont(StandardFonts.HelveticaOblique);

  // Deteksi kebutuhan landscape dari semua tabel di sections.
  let landscape = false;
  for (const sec of opts.sections ?? []) {
    if (sec.table && (sec.table.rows || []).length) {
      if (tableNeedsLandscape(sec.table.headers, sec.table.rows as (string | number)[][], font, 8)) {
        landscape = true;
        break;
      }
    }
  }
  const pageW = landscape ? PAGE_H : PAGE_W;
  const pageH = landscape ? PAGE_W : PAGE_H;
  const margin = MARGIN;

  let page = doc.addPage([pageW, pageH]);
  let y = pageH - margin;

  // Kop sekolah
  y = drawLineCenter(page, 'SEKOLAH MENENGAH — KELAAS', y, bold, 11, BLACK, pageW);
  y = drawLineCenter(page, `Laporan Akademik Siswa • Tahun Ajaran ${esc(ta.ta)} • Semester ${esc(ta.sem)}`, y, font, 8, GRAY, pageW);
  y -= 8;

  // Judul
  y = drawLineCenter(page, esc(opts.title), y, bold, 13, BLACK, pageW);
  if (opts.kelas) y = drawLineCenter(page, 'Kelas: ' + esc(opts.kelas), y, font, 10, BLACK, pageW);
  if (opts.subtitle) y = drawLineCenter(page, esc(opts.subtitle), y, ital, 9, GRAY, pageW);
  y -= 10;

  for (const sec of opts.sections ?? []) {
    if (sec.heading) y = drawLine(page, esc(sec.heading), margin, y, bold, 11);
    if (sec.note) {
      y = drawLine(page, esc(sec.note), margin, y, font, 9, GRAY);
      y -= 4;
    }
    if (sec.table) {
      const rows = (sec.table.rows || []) as (string | number)[][];
      if (rows.length) {
        const res = drawTable(doc, page, y, { headers: sec.table.headers, rows, font, bold, size: 8, pageW, pageH, margin });
        page = res.page;
        y = res.y - 6;
      } else {
        y = drawLine(page, 'Belum ada data.', margin, y, font, 9, GRAY);
        y -= 6;
      }
    }
    y -= 4;
  }

  for (const n of opts.notes ?? []) {
    y = drawLine(page, esc(n), margin, y, ital, 8, GRAY);
    y -= 2;
  }

  return doc.save();
}

// Bungkus hasil PDF menjadi payload siap-download.
function pdfPayload(bytes: Uint8Array, filename: string): { success: boolean; base64: string; filename: string; mimeType: string } {
  let bin = '';
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return { success: true, base64: btoa(bin), filename: filename.replace(/\s+/g, '_') + '.pdf', mimeType: 'application/pdf' };
}

// ---------- 1) REKAP NILAI ----------
export async function generateRekapNilaiPDF(db: D1Database, nip: string, kelas: string, mapel: string): Promise<any> {
  const rekap = await getRekapNilai(db, nip, kelas, mapel);
  const students = (rekap && rekap.students) || [];
  const headers = ['No', 'NIS', 'Nama'];
  const jenis = ['NH1', 'NH2', 'NH3', 'NH4', 'NH5', 'NH6', 'NH7', 'NH8', 'PSTS', 'PSAS'];
  for (const j of jenis) headers.push(j);
  headers.push('Akhir');
  const rows = students.map((x: any, i: number) => {
    const row: (string | number)[] = [i + 1, x.nis, x.nama];
    for (const j of jenis) row.push(x[j] == null ? '-' : x[j]);
    row.push(x.akhir == null ? '-' : x.akhir);
    return row;
  });
  const bytes = await buildPdf(db, {
    title: 'REKAP NILAI SISWA',
    subtitle: 'Mata Pelajaran: ' + (rekap?.mapel || mapel || '-'),
    kelas,
    sections: [{ table: { headers, rows } }],
    notes: [
      'Keterangan: NH = Nilai Harian, PSTS = Penilaian Sumatif Tengah Semester, PSAS = Penilaian Sumatif Akhir Semester.',
      'Wali Kelas: ' + (await waliKelasNama(db, kelas)),
    ],
  });
  return pdfPayload(bytes, 'Rekap_Nilai_' + kelas);
}

async function getRekapNilai(db: D1Database, nip: string, kelas: string, mapel: string): Promise<Record<string, any>> {
  const siswa = await all(db, 'SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa', [kelas]);
  let sql = 'SELECT nis, jenis, nilai FROM nilai WHERE nip=? AND kelas=?';
  const p: unknown[] = [nip, kelas];
  if (mapel) { sql += ' AND mapel=?'; p.push(mapel); }
  const rows = await all(db, sql, p);
  const map: Record<string, Record<string, number>> = {};
  for (const n of rows) {
    const key = String(n.nis);
    if (!map[key]) map[key] = {};
    map[key][String(n.jenis)] = Number(n.nilai) || 0;
  }
  const jenisList = ['NH1', 'NH2', 'NH3', 'NH4', 'NH5', 'NH6', 'NH7', 'NH8', 'PSTS', 'PSAS'];
  const students: Record<string, any>[] = [];
  for (const s of siswa) {
    const row: Record<string, any> = { nis: s.nis, nama: s.nama };
    const vals: number[] = [];
    for (const j of jenisList) {
      const v = map[String(s.nis)]?.[j] ?? null;
      row[j] = v;
      if (v !== null) vals.push(v);
    }
    row.akhir = vals.length ? Math.round((vals.reduce((a, b) => a + b, 0) / vals.length) * 10) / 10 : null;
    students.push(row);
  }
  return { students, mapel: mapel || '-', kelas };
}

// ---------- 2) REKAP KEHADIRAN KELAS ----------
export async function generateRekapanKelasPDF(db: D1Database, kelas: string, start: string, end: string, label: string): Promise<any> {
  const data = await getRekapData(db, kelas, '', start, end);
  const students = data.students || [];
  const dates = data.dates || [];
  const headers = ['No', 'NIS', 'Nama'];
  for (const d of dates) headers.push(fmtDateID(String(d)).substring(0, 5));
  headers.push('H', 'S', 'I', 'A', 'Total');
  const rows = students.map((x: any, i: number) => {
    const rec = x.records || {};
    const sum = x.summary || {};
    const row: (string | number)[] = [i + 1, x.nis, x.nama];
    for (const d of dates) row.push(rec[d] || '-');
    row.push(sum.Hadir || 0, sum.Sakit || 0, sum.Izin || 0, sum.Alfa || 0, x.total || 0);
    return row;
  });
  const bytes = await buildPdf(db, {
    title: 'REKAP KEHADIRAN KELAS',
    subtitle: label || 'Periode: ' + start + ' s/d ' + end,
    kelas,
    sections: [{ table: { headers, rows } }],
    notes: [
      'Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa (tanpa keterangan).',
      'Wali Kelas: ' + (await waliKelasNama(db, kelas)),
    ],
  });
  return pdfPayload(bytes, 'Rekap_Kehadiran_' + kelas);
}

// ---------- 3) REKAP KEHADIRAN PER SISWA ----------
export async function generateRekapanPDF(db: D1Database, kelas: string, nis: string, start: string, end: string, label: string): Promise<any> {
  const data = await getRekapData(db, kelas, nis, start, end);
  const s = (data.students || [])[0] || { nis, nama: nis, records: {}, summary: {}, total: 0 };
  const rows: (string | number)[][] = [
    ['Hadir', s.summary?.Hadir || 0],
    ['Sakit', s.summary?.Sakit || 0],
    ['Izin', s.summary?.Izin || 0],
    ['Alfa', s.summary?.Alfa || 0],
    ['Total', s.total || 0],
  ];
  const bytes = await buildPdf(db, {
    title: 'REKAP KEHADIRAN SISWA',
    subtitle: label || 'Periode: ' + start + ' s/d ' + end,
    kelas,
    sections: [
      { heading: 'Nama: ' + s.nama },
      { heading: 'NIS: ' + s.nis },
      { table: { headers: ['Keterangan', 'Jumlah'], rows } },
    ],
    notes: ['Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa.', 'Wali Kelas: ' + (await waliKelasNama(db, kelas))],
  });
  return pdfPayload(bytes, 'Rekapan_' + nis);
}

// ---------- 4) REKAP PRESENSI MAPEL PER GURU ----------
export async function generateRekapMapelPDF(db: D1Database, nip: string, kelas: string, mapel: string, start: string, end: string, label: string, guruNama?: string): Promise<any> {
  const data = await getPresensiMapelRekap(db, nip, kelas, mapel, start, end);
  const students = data.students || [];
  const dates = data.dates || [];
  const headers = ['No', 'NIS', 'Nama'];
  for (const d of dates) headers.push(fmtDateID(String(d)).substring(0, 5));
  headers.push('H', 'S', 'I', 'A', 'D', 'Total');
  const rows = students.map((x: any, i: number) => {
    const rec = x.records || {};
    const sm = x.summary || {};
    const row: (string | number)[] = [i + 1, x.nis, x.nama];
    for (const d of dates) row.push(rec[d] || '-');
    row.push(sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0);
    return row;
  });
  const bytes = await buildPdf(db, {
    title: 'REKAP PRESENSI MAPEL',
    subtitle: label || 'Periode: ' + start + ' s/d ' + end,
    kelas,
    sections: [
      { heading: 'Mapel: ' + mapel },
      { table: { headers, rows } },
    ],
    notes: ['Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa, D = Dispensasi.', 'Guru Mapel: ' + (guruNama || '-')],
  });
  return pdfPayload(bytes, 'Rekap_Presensi_' + kelas + '_' + mapel);
}

// ---------- 5) LAPORAN ADMINISTRASI GURU ----------
export async function generateLaporanAdminPDF(db: D1Database, nip: string, kelas: string, mapel: string, start: string, end: string): Promise<any> {
  const d = await getLaporanAdminData(db, nip, kelas, mapel, start, end);
  const students = d.students || [];
  const jurnal = d.jurnal || [];
  const h1 = ['No', 'NIS', 'Nama', 'Hadir', 'Sakit', 'Izin', 'Alfa', 'Disp.', 'Total'];
  const rows1 = students.map((x: any, i: number) => {
    const sm = x.summary || {};
    return [i + 1, x.nis, x.nama, sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0];
  });
  const jrows = jurnal.map((x: any, i: number) => [i + 1, fmtDateID(String(x.tanggal)), 'Jam ' + (x.jamKe || '-'), x.materi, x.kegiatan]);
  const bytes = await buildPdf(db, {
    title: 'LAPORAN ADMINISTRASI PEMBELAJARAN',
    subtitle: 'Periode: ' + start + ' s/d ' + end,
    kelas,
    sections: [
      { heading: 'Mapel: ' + mapel },
      { heading: 'A. REKAP PRESENSI SISWA', table: { headers: h1, rows: rows1 } },
      { heading: 'B. JURNAL MENGAJAR', table: { headers: ['No', 'Tanggal', 'Jam', 'Materi', 'Kegiatan'], rows: jrows } },
    ],
    notes: ['Jumlah baris direvisi: ' + (d.revisiCount || 0)],
  });
  return pdfPayload(bytes, 'Laporan_Administrasi_' + kelas + '_' + mapel);
}

// ---------- 6) REKAP LENGKAP ----------
export async function generateRekapLengkapPDF(db: D1Database, nip: string, kelas: string, mapel: string, start: string, end: string): Promise<any> {
  const rekap = await getRekapNilai(db, nip, kelas, mapel);
  const students = (rekap && rekap.students) || [];
  const pres = await getPresensiMapelRekap(db, nip, kelas, mapel, start, end);
  const pStudents = pres.students || [];
  const pDates = pres.dates || [];
  const admin = await getLaporanAdminData(db, nip, kelas, mapel, start, end);
  const jurnal = admin.jurnal || [];

  const h1 = ['No', 'NIS', 'Nama'];
  for (let j = 0; j < 8; j++) h1.push('NH' + (j + 1));
  h1.push('PSTS', 'PSAS', 'Akhir');
  const r1 = students.map((x: any, i: number) => {
    const row: (string | number)[] = [i + 1, x.nis, x.nama];
    for (let k = 0; k < 8; k++) row.push(x['NH' + (k + 1)] == null ? '-' : x['NH' + (k + 1)]);
    row.push(x.PSTS == null ? '-' : x.PSTS, x.PSAS == null ? '-' : x.PSAS, x.akhir == null ? '-' : x.akhir);
    return row;
  });

  const h2 = ['No', 'NIS', 'Nama'];
  for (const d of pDates) h2.push(fmtDateID(String(d)).substring(0, 5));
  h2.push('H', 'S', 'I', 'A', 'D', 'Total');
  const r2 = pStudents.map((x: any, i: number) => {
    const rec = x.records || {};
    const sm = x.summary || {};
    const row: (string | number)[] = [i + 1, x.nis, x.nama];
    for (const d of pDates) row.push(rec[d] || '-');
    row.push(sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0);
    return row;
  });

  const r3 = jurnal.map((x: any, i: number) => [i + 1, fmtDateID(String(x.tanggal)), 'Jam ' + (x.jamKe || '-'), x.materi, x.kegiatan]);

  const bytes = await buildPdf(db, {
    title: 'REKAP LENGKAP PEMBELAJARAN',
    subtitle: 'Mapel: ' + mapel + ' • Periode: ' + start + ' s/d ' + end,
    kelas,
    sections: [
      { heading: 'A. NILAI SISWA', table: { headers: h1, rows: r1 } },
      { heading: 'B. REKAP PRESENSI MAPEL', table: { headers: h2, rows: r2 } },
      { heading: 'C. JURNAL MENGAJAR', table: { headers: ['No', 'Tanggal', 'Jam', 'Materi', 'Kegiatan'], rows: r3 } },
    ],
    notes: [
      'Keterangan: NH = Nilai Harian, PSTS = Penilaian Sumatif Tengah Semester, PSAS = Penilaian Sumatif Akhir Semester.',
      'Wali Kelas / Guru: ' + (await waliKelasNama(db, kelas)),
    ],
  });
  return pdfPayload(bytes, 'Rekap_Nilai_Kehadiran_' + kelas);
}

// ---------- 7) MODUL AJAR (hasil AI) ----------
export async function generateModulPDF(db: D1Database, text: string, judul: string): Promise<any> {
  const md = String(text || '').trim();
  const paragraphs = md.split(/\n{2,}/).map((p) => p.replace(/\n/g, ' ')).filter(Boolean);
  const rows = paragraphs.map((p, i) => [i + 1, p] as (string | number)[]);
  const bytes = await buildPdf(db, {
    title: judul || 'Modul_Ajar',
    sections: [{ table: { headers: ['No', 'Isi'], rows } }],
  });
  return pdfPayload(bytes, judul || 'Modul_Ajar');
}

// ---------- helpers data ----------
async function getRekapData(db: D1Database, kelas: string, nis: string, start: string, end: string): Promise<Record<string, any>> {
  let sql = 'SELECT nis, nama_siswa AS nama, jk FROM siswa WHERE kelas=?';
  const p: unknown[] = [kelas];
  if (nis) { sql += ' AND nis=?'; p.push(nis); }
  const siswa = await all(db, sql, p);
  sql = 'SELECT tanggal, nis, status FROM kehadiran WHERE kelas=? AND tanggal>=? AND tanggal<=?';
  const p2: unknown[] = [kelas, start, end];
  if (nis) { sql += ' AND nis=?'; p2.push(nis); }
  const raw = await all(db, sql, p2);
  const dates = Array.from(new Set(raw.map((r) => String(r.tanggal)))).sort();
  const res: Record<string, any>[] = [];
  for (const s of siswa) {
    const recs: Record<string, string> = {};
    const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
    for (const r of raw) {
      if (String(r.nis) === String(s.nis)) {
        recs[String(r.tanggal)] = String(r.status);
        const st = String(r.status);
        if (st in sum) sum[st as keyof typeof sum]++;
      }
    }
    res.push({ nis: s.nis, nama: s.nama, jk: s.jk, records: recs, summary: sum, total: sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa });
  }
  return { students: res, dates };
}

async function getPresensiMapelRekap(db: D1Database, nip: string, kelas: string, mapel: string, start: string, end: string): Promise<Record<string, any>> {
  const siswa = await all(db, 'SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa', [kelas]);
  let raw;
  if (start && end) {
    raw = await all(db, 'SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?', [nip, kelas, mapel, start, end]);
  } else {
    raw = await all(db, 'SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=?', [nip, kelas, mapel]);
  }
  const dates = Array.from(new Set(raw.map((r) => String(r.tanggal)))).sort();
  const res: Record<string, any>[] = [];
  for (const s of siswa) {
    const recs: Record<string, string> = {};
    const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
    for (const r of raw) {
      if (String(r.nis) === String(s.nis)) {
        recs[String(r.tanggal)] = String(r.status);
        const st = String(r.status);
        if (st in sum) sum[st as keyof typeof sum]++;
      }
    }
    res.push({ nis: s.nis, nama: s.nama, records: recs, summary: sum, total: sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa + sum.Dispensasi });
  }
  return { students: res, dates };
}

async function getLaporanAdminData(db: D1Database, nip: string, kelas: string, mapel: string, start: string, end: string): Promise<Record<string, any>> {
  const siswa = await all(db, 'SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa', [kelas]);
  const raw = await all(db, 'SELECT tanggal, nis, status, updated_at FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?', [nip, kelas, mapel, start, end]);
  let revisi = 0;
  const byNis: Record<string, Record<string, number>> = {};
  for (const r of raw) {
    if (r.updated_at) revisi++;
    const key = String(r.nis);
    if (!byNis[key]) byNis[key] = {};
    byNis[key][String(r.status)] = (byNis[key][String(r.status)] || 0) + 1;
  }
  const students: Record<string, any>[] = [];
  for (const s of siswa) {
    const sm = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
    for (const [k, v] of Object.entries(byNis[String(s.nis)] || {})) if (k in sm) sm[k as keyof typeof sm] = v;
    const tot = sm.Hadir + sm.Sakit + sm.Izin + sm.Alfa + sm.Dispensasi;
    students.push({ nis: s.nis, nama: s.nama, summary: sm, total: tot, pct: tot ? Math.round((sm.Hadir / tot) * 100) : 0 });
  }
  const jurnal = await all(db, 'SELECT tanggal, jam_ke AS jamKe, materi, kegiatan, status FROM jurnal_mengajar WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=? ORDER BY tanggal, jam_ke', [nip, kelas, mapel, start, end]);
  return { students, dates: [], jurnal, revisiCount: revisi };
}

export const pdfDate = fmtDateID;
export { todayWIB };
