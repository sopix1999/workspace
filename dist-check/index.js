var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });
var __require = /* @__PURE__ */ ((x) => typeof require !== "undefined" ? require : typeof Proxy !== "undefined" ? new Proxy(x, {
  get: (a, b) => (typeof require !== "undefined" ? require : a)[b]
}) : x)(function(x) {
  if (typeof require !== "undefined") return require.apply(this, arguments);
  throw Error('Dynamic require of "' + x + '" is not supported');
});
var __esm = (fn, res, err2) => function __init() {
  if (err2) throw err2[0];
  try {
    return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
  } catch (e) {
    throw err2 = [e], e;
  }
};
var __commonJS = (cb, mod) => function __require2() {
  try {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  } catch (e) {
    throw mod = 0, e;
  }
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// node_modules/unenv/dist/runtime/_internal/utils.mjs
// @__NO_SIDE_EFFECTS__
function createNotImplementedError(name) {
  return new Error(`[unenv] ${name} is not implemented yet!`);
}
// @__NO_SIDE_EFFECTS__
function notImplemented(name) {
  const fn = /* @__PURE__ */ __name(() => {
    throw /* @__PURE__ */ createNotImplementedError(name);
  }, "fn");
  return Object.assign(fn, { __unenv__: true });
}
// @__NO_SIDE_EFFECTS__
function notImplementedClass(name) {
  return class {
    __unenv__ = true;
    constructor() {
      throw new Error(`[unenv] ${name} is not implemented yet!`);
    }
  };
}
var init_utils = __esm({
  "node_modules/unenv/dist/runtime/_internal/utils.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    __name(createNotImplementedError, "createNotImplementedError");
    __name(notImplemented, "notImplemented");
    __name(notImplementedClass, "notImplementedClass");
  }
});

// node_modules/unenv/dist/runtime/node/internal/perf_hooks/performance.mjs
var _timeOrigin, _performanceNow, nodeTiming, PerformanceEntry, PerformanceMark, PerformanceMeasure, PerformanceResourceTiming, PerformanceObserverEntryList, Performance, PerformanceObserver, performance;
var init_performance = __esm({
  "node_modules/unenv/dist/runtime/node/internal/perf_hooks/performance.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_utils();
    _timeOrigin = globalThis.performance?.timeOrigin ?? Date.now();
    _performanceNow = globalThis.performance?.now ? globalThis.performance.now.bind(globalThis.performance) : () => Date.now() - _timeOrigin;
    nodeTiming = {
      name: "node",
      entryType: "node",
      startTime: 0,
      duration: 0,
      nodeStart: 0,
      v8Start: 0,
      bootstrapComplete: 0,
      environment: 0,
      loopStart: 0,
      loopExit: 0,
      idleTime: 0,
      uvMetricsInfo: {
        loopCount: 0,
        events: 0,
        eventsWaiting: 0
      },
      detail: void 0,
      toJSON() {
        return this;
      }
    };
    PerformanceEntry = class {
      static {
        __name(this, "PerformanceEntry");
      }
      __unenv__ = true;
      detail;
      entryType = "event";
      name;
      startTime;
      constructor(name, options) {
        this.name = name;
        this.startTime = options?.startTime || _performanceNow();
        this.detail = options?.detail;
      }
      get duration() {
        return _performanceNow() - this.startTime;
      }
      toJSON() {
        return {
          name: this.name,
          entryType: this.entryType,
          startTime: this.startTime,
          duration: this.duration,
          detail: this.detail
        };
      }
    };
    PerformanceMark = class PerformanceMark2 extends PerformanceEntry {
      static {
        __name(this, "PerformanceMark");
      }
      entryType = "mark";
      constructor() {
        super(...arguments);
      }
      get duration() {
        return 0;
      }
    };
    PerformanceMeasure = class extends PerformanceEntry {
      static {
        __name(this, "PerformanceMeasure");
      }
      entryType = "measure";
    };
    PerformanceResourceTiming = class extends PerformanceEntry {
      static {
        __name(this, "PerformanceResourceTiming");
      }
      entryType = "resource";
      serverTiming = [];
      connectEnd = 0;
      connectStart = 0;
      decodedBodySize = 0;
      domainLookupEnd = 0;
      domainLookupStart = 0;
      encodedBodySize = 0;
      fetchStart = 0;
      initiatorType = "";
      name = "";
      nextHopProtocol = "";
      redirectEnd = 0;
      redirectStart = 0;
      requestStart = 0;
      responseEnd = 0;
      responseStart = 0;
      secureConnectionStart = 0;
      startTime = 0;
      transferSize = 0;
      workerStart = 0;
      responseStatus = 0;
    };
    PerformanceObserverEntryList = class {
      static {
        __name(this, "PerformanceObserverEntryList");
      }
      __unenv__ = true;
      getEntries() {
        return [];
      }
      getEntriesByName(_name, _type) {
        return [];
      }
      getEntriesByType(type) {
        return [];
      }
    };
    Performance = class {
      static {
        __name(this, "Performance");
      }
      __unenv__ = true;
      timeOrigin = _timeOrigin;
      eventCounts = /* @__PURE__ */ new Map();
      _entries = [];
      _resourceTimingBufferSize = 0;
      navigation = void 0;
      timing = void 0;
      timerify(_fn, _options) {
        throw createNotImplementedError("Performance.timerify");
      }
      get nodeTiming() {
        return nodeTiming;
      }
      eventLoopUtilization() {
        return {};
      }
      markResourceTiming() {
        return new PerformanceResourceTiming("");
      }
      onresourcetimingbufferfull = null;
      now() {
        if (this.timeOrigin === _timeOrigin) {
          return _performanceNow();
        }
        return Date.now() - this.timeOrigin;
      }
      clearMarks(markName) {
        this._entries = markName ? this._entries.filter((e) => e.name !== markName) : this._entries.filter((e) => e.entryType !== "mark");
      }
      clearMeasures(measureName) {
        this._entries = measureName ? this._entries.filter((e) => e.name !== measureName) : this._entries.filter((e) => e.entryType !== "measure");
      }
      clearResourceTimings() {
        this._entries = this._entries.filter((e) => e.entryType !== "resource" || e.entryType !== "navigation");
      }
      getEntries() {
        return this._entries;
      }
      getEntriesByName(name, type) {
        return this._entries.filter((e) => e.name === name && (!type || e.entryType === type));
      }
      getEntriesByType(type) {
        return this._entries.filter((e) => e.entryType === type);
      }
      mark(name, options) {
        const entry = new PerformanceMark(name, options);
        this._entries.push(entry);
        return entry;
      }
      measure(measureName, startOrMeasureOptions, endMark) {
        let start;
        let end;
        if (typeof startOrMeasureOptions === "string") {
          start = this.getEntriesByName(startOrMeasureOptions, "mark")[0]?.startTime;
          end = this.getEntriesByName(endMark, "mark")[0]?.startTime;
        } else {
          start = Number.parseFloat(startOrMeasureOptions?.start) || this.now();
          end = Number.parseFloat(startOrMeasureOptions?.end) || this.now();
        }
        const entry = new PerformanceMeasure(measureName, {
          startTime: start,
          detail: {
            start,
            end
          }
        });
        this._entries.push(entry);
        return entry;
      }
      setResourceTimingBufferSize(maxSize) {
        this._resourceTimingBufferSize = maxSize;
      }
      addEventListener(type, listener, options) {
        throw createNotImplementedError("Performance.addEventListener");
      }
      removeEventListener(type, listener, options) {
        throw createNotImplementedError("Performance.removeEventListener");
      }
      dispatchEvent(event) {
        throw createNotImplementedError("Performance.dispatchEvent");
      }
      toJSON() {
        return this;
      }
    };
    PerformanceObserver = class {
      static {
        __name(this, "PerformanceObserver");
      }
      __unenv__ = true;
      static supportedEntryTypes = [];
      _callback = null;
      constructor(callback) {
        this._callback = callback;
      }
      takeRecords() {
        return [];
      }
      disconnect() {
        throw createNotImplementedError("PerformanceObserver.disconnect");
      }
      observe(options) {
        throw createNotImplementedError("PerformanceObserver.observe");
      }
      bind(fn) {
        return fn;
      }
      runInAsyncScope(fn, thisArg, ...args2) {
        return fn.call(thisArg, ...args2);
      }
      asyncId() {
        return 0;
      }
      triggerAsyncId() {
        return 0;
      }
      emitDestroy() {
        return this;
      }
    };
    performance = globalThis.performance && "addEventListener" in globalThis.performance ? globalThis.performance : new Performance();
  }
});

// node_modules/unenv/dist/runtime/node/perf_hooks.mjs
var init_perf_hooks = __esm({
  "node_modules/unenv/dist/runtime/node/perf_hooks.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_performance();
  }
});

// node_modules/@cloudflare/unenv-preset/dist/runtime/polyfill/performance.mjs
var init_performance2 = __esm({
  "node_modules/@cloudflare/unenv-preset/dist/runtime/polyfill/performance.mjs"() {
    init_perf_hooks();
    if (!("__unenv__" in performance)) {
      const proto = Performance.prototype;
      for (const key of Object.getOwnPropertyNames(proto)) {
        if (key !== "constructor" && !(key in performance)) {
          const desc = Object.getOwnPropertyDescriptor(proto, key);
          if (desc) {
            Object.defineProperty(performance, key, desc);
          }
        }
      }
    }
    globalThis.performance = performance;
    globalThis.Performance = Performance;
    globalThis.PerformanceEntry = PerformanceEntry;
    globalThis.PerformanceMark = PerformanceMark;
    globalThis.PerformanceMeasure = PerformanceMeasure;
    globalThis.PerformanceObserver = PerformanceObserver;
    globalThis.PerformanceObserverEntryList = PerformanceObserverEntryList;
    globalThis.PerformanceResourceTiming = PerformanceResourceTiming;
  }
});

// node_modules/unenv/dist/runtime/mock/noop.mjs
var noop_default;
var init_noop = __esm({
  "node_modules/unenv/dist/runtime/mock/noop.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    noop_default = Object.assign(() => {
    }, { __unenv__: true });
  }
});

// node_modules/unenv/dist/runtime/node/console.mjs
import { Writable } from "node:stream";
var _console, _ignoreErrors, _stderr, _stdout, log, info, trace, debug, table, error, warn, createTask, clear, count, countReset, dir, dirxml, group, groupEnd, groupCollapsed, profile, profileEnd, time, timeEnd, timeLog, timeStamp, Console, _times, _stdoutErrorHandler, _stderrErrorHandler;
var init_console = __esm({
  "node_modules/unenv/dist/runtime/node/console.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_noop();
    init_utils();
    _console = globalThis.console;
    _ignoreErrors = true;
    _stderr = new Writable();
    _stdout = new Writable();
    log = _console?.log ?? noop_default;
    info = _console?.info ?? log;
    trace = _console?.trace ?? info;
    debug = _console?.debug ?? log;
    table = _console?.table ?? log;
    error = _console?.error ?? log;
    warn = _console?.warn ?? error;
    createTask = _console?.createTask ?? /* @__PURE__ */ notImplemented("console.createTask");
    clear = _console?.clear ?? noop_default;
    count = _console?.count ?? noop_default;
    countReset = _console?.countReset ?? noop_default;
    dir = _console?.dir ?? noop_default;
    dirxml = _console?.dirxml ?? noop_default;
    group = _console?.group ?? noop_default;
    groupEnd = _console?.groupEnd ?? noop_default;
    groupCollapsed = _console?.groupCollapsed ?? noop_default;
    profile = _console?.profile ?? noop_default;
    profileEnd = _console?.profileEnd ?? noop_default;
    time = _console?.time ?? noop_default;
    timeEnd = _console?.timeEnd ?? noop_default;
    timeLog = _console?.timeLog ?? noop_default;
    timeStamp = _console?.timeStamp ?? noop_default;
    Console = _console?.Console ?? /* @__PURE__ */ notImplementedClass("console.Console");
    _times = /* @__PURE__ */ new Map();
    _stdoutErrorHandler = noop_default;
    _stderrErrorHandler = noop_default;
  }
});

// node_modules/@cloudflare/unenv-preset/dist/runtime/node/console.mjs
var workerdConsole, assert, clear2, context, count2, countReset2, createTask2, debug2, dir2, dirxml2, error2, group2, groupCollapsed2, groupEnd2, info2, log2, profile2, profileEnd2, table2, time2, timeEnd2, timeLog2, timeStamp2, trace2, warn2, console_default;
var init_console2 = __esm({
  "node_modules/@cloudflare/unenv-preset/dist/runtime/node/console.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_console();
    workerdConsole = globalThis["console"];
    ({
      assert,
      clear: clear2,
      context: (
        // @ts-expect-error undocumented public API
        context
      ),
      count: count2,
      countReset: countReset2,
      createTask: (
        // @ts-expect-error undocumented public API
        createTask2
      ),
      debug: debug2,
      dir: dir2,
      dirxml: dirxml2,
      error: error2,
      group: group2,
      groupCollapsed: groupCollapsed2,
      groupEnd: groupEnd2,
      info: info2,
      log: log2,
      profile: profile2,
      profileEnd: profileEnd2,
      table: table2,
      time: time2,
      timeEnd: timeEnd2,
      timeLog: timeLog2,
      timeStamp: timeStamp2,
      trace: trace2,
      warn: warn2
    } = workerdConsole);
    Object.assign(workerdConsole, {
      Console,
      _ignoreErrors,
      _stderr,
      _stderrErrorHandler,
      _stdout,
      _stdoutErrorHandler,
      _times
    });
    console_default = workerdConsole;
  }
});

// node_modules/wrangler/_virtual_unenv_global_polyfill-@cloudflare-unenv-preset-node-console
var init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console = __esm({
  "node_modules/wrangler/_virtual_unenv_global_polyfill-@cloudflare-unenv-preset-node-console"() {
    init_console2();
    globalThis.console = console_default;
  }
});

// node_modules/unenv/dist/runtime/node/internal/process/hrtime.mjs
var hrtime;
var init_hrtime = __esm({
  "node_modules/unenv/dist/runtime/node/internal/process/hrtime.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    hrtime = /* @__PURE__ */ Object.assign(/* @__PURE__ */ __name(function hrtime2(startTime) {
      const now = Date.now();
      const seconds = Math.trunc(now / 1e3);
      const nanos = now % 1e3 * 1e6;
      if (startTime) {
        let diffSeconds = seconds - startTime[0];
        let diffNanos = nanos - startTime[0];
        if (diffNanos < 0) {
          diffSeconds = diffSeconds - 1;
          diffNanos = 1e9 + diffNanos;
        }
        return [diffSeconds, diffNanos];
      }
      return [seconds, nanos];
    }, "hrtime"), { bigint: /* @__PURE__ */ __name(function bigint() {
      return BigInt(Date.now() * 1e6);
    }, "bigint") });
  }
});

// node_modules/unenv/dist/runtime/node/internal/tty/read-stream.mjs
var ReadStream;
var init_read_stream = __esm({
  "node_modules/unenv/dist/runtime/node/internal/tty/read-stream.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    ReadStream = class {
      static {
        __name(this, "ReadStream");
      }
      fd;
      isRaw = false;
      isTTY = false;
      constructor(fd) {
        this.fd = fd;
      }
      setRawMode(mode) {
        this.isRaw = mode;
        return this;
      }
    };
  }
});

// node_modules/unenv/dist/runtime/node/internal/tty/write-stream.mjs
var WriteStream;
var init_write_stream = __esm({
  "node_modules/unenv/dist/runtime/node/internal/tty/write-stream.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    WriteStream = class {
      static {
        __name(this, "WriteStream");
      }
      fd;
      columns = 80;
      rows = 24;
      isTTY = false;
      constructor(fd) {
        this.fd = fd;
      }
      clearLine(dir3, callback) {
        callback && callback();
        return false;
      }
      clearScreenDown(callback) {
        callback && callback();
        return false;
      }
      cursorTo(x, y, callback) {
        callback && typeof callback === "function" && callback();
        return false;
      }
      moveCursor(dx, dy, callback) {
        callback && callback();
        return false;
      }
      getColorDepth(env2) {
        return 1;
      }
      hasColors(count3, env2) {
        return false;
      }
      getWindowSize() {
        return [this.columns, this.rows];
      }
      write(str, encoding, cb) {
        if (str instanceof Uint8Array) {
          str = new TextDecoder().decode(str);
        }
        try {
          console.log(str);
        } catch {
        }
        cb && typeof cb === "function" && cb();
        return false;
      }
    };
  }
});

// node_modules/unenv/dist/runtime/node/tty.mjs
var init_tty = __esm({
  "node_modules/unenv/dist/runtime/node/tty.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_read_stream();
    init_write_stream();
  }
});

// node_modules/unenv/dist/runtime/node/internal/process/node-version.mjs
var NODE_VERSION;
var init_node_version = __esm({
  "node_modules/unenv/dist/runtime/node/internal/process/node-version.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    NODE_VERSION = "22.14.0";
  }
});

// node_modules/unenv/dist/runtime/node/internal/process/process.mjs
import { EventEmitter } from "node:events";
var Process;
var init_process = __esm({
  "node_modules/unenv/dist/runtime/node/internal/process/process.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_tty();
    init_utils();
    init_node_version();
    Process = class _Process extends EventEmitter {
      static {
        __name(this, "Process");
      }
      env;
      hrtime;
      nextTick;
      constructor(impl) {
        super();
        this.env = impl.env;
        this.hrtime = impl.hrtime;
        this.nextTick = impl.nextTick;
        for (const prop of [...Object.getOwnPropertyNames(_Process.prototype), ...Object.getOwnPropertyNames(EventEmitter.prototype)]) {
          const value = this[prop];
          if (typeof value === "function") {
            this[prop] = value.bind(this);
          }
        }
      }
      // --- event emitter ---
      emitWarning(warning, type, code) {
        console.warn(`${code ? `[${code}] ` : ""}${type ? `${type}: ` : ""}${warning}`);
      }
      emit(...args2) {
        return super.emit(...args2);
      }
      listeners(eventName) {
        return super.listeners(eventName);
      }
      // --- stdio (lazy initializers) ---
      #stdin;
      #stdout;
      #stderr;
      get stdin() {
        return this.#stdin ??= new ReadStream(0);
      }
      get stdout() {
        return this.#stdout ??= new WriteStream(1);
      }
      get stderr() {
        return this.#stderr ??= new WriteStream(2);
      }
      // --- cwd ---
      #cwd = "/";
      chdir(cwd2) {
        this.#cwd = cwd2;
      }
      cwd() {
        return this.#cwd;
      }
      // --- dummy props and getters ---
      arch = "";
      platform = "";
      argv = [];
      argv0 = "";
      execArgv = [];
      execPath = "";
      title = "";
      pid = 200;
      ppid = 100;
      get version() {
        return `v${NODE_VERSION}`;
      }
      get versions() {
        return { node: NODE_VERSION };
      }
      get allowedNodeEnvironmentFlags() {
        return /* @__PURE__ */ new Set();
      }
      get sourceMapsEnabled() {
        return false;
      }
      get debugPort() {
        return 0;
      }
      get throwDeprecation() {
        return false;
      }
      get traceDeprecation() {
        return false;
      }
      get features() {
        return {};
      }
      get release() {
        return {};
      }
      get connected() {
        return false;
      }
      get config() {
        return {};
      }
      get moduleLoadList() {
        return [];
      }
      constrainedMemory() {
        return 0;
      }
      availableMemory() {
        return 0;
      }
      uptime() {
        return 0;
      }
      resourceUsage() {
        return {};
      }
      // --- noop methods ---
      ref() {
      }
      unref() {
      }
      // --- unimplemented methods ---
      umask() {
        throw createNotImplementedError("process.umask");
      }
      getBuiltinModule() {
        return void 0;
      }
      getActiveResourcesInfo() {
        throw createNotImplementedError("process.getActiveResourcesInfo");
      }
      exit() {
        throw createNotImplementedError("process.exit");
      }
      reallyExit() {
        throw createNotImplementedError("process.reallyExit");
      }
      kill() {
        throw createNotImplementedError("process.kill");
      }
      abort() {
        throw createNotImplementedError("process.abort");
      }
      dlopen() {
        throw createNotImplementedError("process.dlopen");
      }
      setSourceMapsEnabled() {
        throw createNotImplementedError("process.setSourceMapsEnabled");
      }
      loadEnvFile() {
        throw createNotImplementedError("process.loadEnvFile");
      }
      disconnect() {
        throw createNotImplementedError("process.disconnect");
      }
      cpuUsage() {
        throw createNotImplementedError("process.cpuUsage");
      }
      setUncaughtExceptionCaptureCallback() {
        throw createNotImplementedError("process.setUncaughtExceptionCaptureCallback");
      }
      hasUncaughtExceptionCaptureCallback() {
        throw createNotImplementedError("process.hasUncaughtExceptionCaptureCallback");
      }
      initgroups() {
        throw createNotImplementedError("process.initgroups");
      }
      openStdin() {
        throw createNotImplementedError("process.openStdin");
      }
      assert() {
        throw createNotImplementedError("process.assert");
      }
      binding() {
        throw createNotImplementedError("process.binding");
      }
      // --- attached interfaces ---
      permission = { has: /* @__PURE__ */ notImplemented("process.permission.has") };
      report = {
        directory: "",
        filename: "",
        signal: "SIGUSR2",
        compact: false,
        reportOnFatalError: false,
        reportOnSignal: false,
        reportOnUncaughtException: false,
        getReport: /* @__PURE__ */ notImplemented("process.report.getReport"),
        writeReport: /* @__PURE__ */ notImplemented("process.report.writeReport")
      };
      finalization = {
        register: /* @__PURE__ */ notImplemented("process.finalization.register"),
        unregister: /* @__PURE__ */ notImplemented("process.finalization.unregister"),
        registerBeforeExit: /* @__PURE__ */ notImplemented("process.finalization.registerBeforeExit")
      };
      memoryUsage = Object.assign(() => ({
        arrayBuffers: 0,
        rss: 0,
        external: 0,
        heapTotal: 0,
        heapUsed: 0
      }), { rss: /* @__PURE__ */ __name(() => 0, "rss") });
      // --- undefined props ---
      mainModule = void 0;
      domain = void 0;
      // optional
      send = void 0;
      exitCode = void 0;
      channel = void 0;
      getegid = void 0;
      geteuid = void 0;
      getgid = void 0;
      getgroups = void 0;
      getuid = void 0;
      setegid = void 0;
      seteuid = void 0;
      setgid = void 0;
      setgroups = void 0;
      setuid = void 0;
      // internals
      _events = void 0;
      _eventsCount = void 0;
      _exiting = void 0;
      _maxListeners = void 0;
      _debugEnd = void 0;
      _debugProcess = void 0;
      _fatalException = void 0;
      _getActiveHandles = void 0;
      _getActiveRequests = void 0;
      _kill = void 0;
      _preload_modules = void 0;
      _rawDebug = void 0;
      _startProfilerIdleNotifier = void 0;
      _stopProfilerIdleNotifier = void 0;
      _tickCallback = void 0;
      _disconnect = void 0;
      _handleQueue = void 0;
      _pendingMessage = void 0;
      _channel = void 0;
      _send = void 0;
      _linkedBinding = void 0;
    };
  }
});

// node_modules/@cloudflare/unenv-preset/dist/runtime/node/process.mjs
var globalProcess, getBuiltinModule, workerdProcess, unenvProcess, exit, features, platform, _channel, _debugEnd, _debugProcess, _disconnect, _events, _eventsCount, _exiting, _fatalException, _getActiveHandles, _getActiveRequests, _handleQueue, _kill, _linkedBinding, _maxListeners, _pendingMessage, _preload_modules, _rawDebug, _send, _startProfilerIdleNotifier, _stopProfilerIdleNotifier, _tickCallback, abort, addListener, allowedNodeEnvironmentFlags, arch, argv, argv0, assert2, availableMemory, binding, channel, chdir, config, connected, constrainedMemory, cpuUsage, cwd, debugPort, disconnect, dlopen, domain, emit, emitWarning, env, eventNames, execArgv, execPath, exitCode, finalization, getActiveResourcesInfo, getegid, geteuid, getgid, getgroups, getMaxListeners, getuid, hasUncaughtExceptionCaptureCallback, hrtime3, initgroups, kill, listenerCount, listeners, loadEnvFile, mainModule, memoryUsage, moduleLoadList, nextTick, off, on, once, openStdin, permission, pid, ppid, prependListener, prependOnceListener, rawListeners, reallyExit, ref, release, removeAllListeners, removeListener, report, resourceUsage, send, setegid, seteuid, setgid, setgroups, setMaxListeners, setSourceMapsEnabled, setuid, setUncaughtExceptionCaptureCallback, sourceMapsEnabled, stderr, stdin, stdout, throwDeprecation, title, traceDeprecation, umask, unref, uptime, version, versions, _process, process_default;
var init_process2 = __esm({
  "node_modules/@cloudflare/unenv-preset/dist/runtime/node/process.mjs"() {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    init_hrtime();
    init_process();
    globalProcess = globalThis["process"];
    getBuiltinModule = globalProcess.getBuiltinModule;
    workerdProcess = getBuiltinModule("node:process");
    unenvProcess = new Process({
      env: globalProcess.env,
      hrtime,
      // `nextTick` is available from workerd process v1
      nextTick: workerdProcess.nextTick
    });
    ({ exit, features, platform } = workerdProcess);
    ({
      _channel,
      _debugEnd,
      _debugProcess,
      _disconnect,
      _events,
      _eventsCount,
      _exiting,
      _fatalException,
      _getActiveHandles,
      _getActiveRequests,
      _handleQueue,
      _kill,
      _linkedBinding,
      _maxListeners,
      _pendingMessage,
      _preload_modules,
      _rawDebug,
      _send,
      _startProfilerIdleNotifier,
      _stopProfilerIdleNotifier,
      _tickCallback,
      abort,
      addListener,
      allowedNodeEnvironmentFlags,
      arch,
      argv,
      argv0,
      assert: assert2,
      availableMemory,
      binding,
      channel,
      chdir,
      config,
      connected,
      constrainedMemory,
      cpuUsage,
      cwd,
      debugPort,
      disconnect,
      dlopen,
      domain,
      emit,
      emitWarning,
      env,
      eventNames,
      execArgv,
      execPath,
      exitCode,
      finalization,
      getActiveResourcesInfo,
      getegid,
      geteuid,
      getgid,
      getgroups,
      getMaxListeners,
      getuid,
      hasUncaughtExceptionCaptureCallback,
      hrtime: hrtime3,
      initgroups,
      kill,
      listenerCount,
      listeners,
      loadEnvFile,
      mainModule,
      memoryUsage,
      moduleLoadList,
      nextTick,
      off,
      on,
      once,
      openStdin,
      permission,
      pid,
      ppid,
      prependListener,
      prependOnceListener,
      rawListeners,
      reallyExit,
      ref,
      release,
      removeAllListeners,
      removeListener,
      report,
      resourceUsage,
      send,
      setegid,
      seteuid,
      setgid,
      setgroups,
      setMaxListeners,
      setSourceMapsEnabled,
      setuid,
      setUncaughtExceptionCaptureCallback,
      sourceMapsEnabled,
      stderr,
      stdin,
      stdout,
      throwDeprecation,
      title,
      traceDeprecation,
      umask,
      unref,
      uptime,
      version,
      versions
    } = unenvProcess);
    _process = {
      abort,
      addListener,
      allowedNodeEnvironmentFlags,
      hasUncaughtExceptionCaptureCallback,
      setUncaughtExceptionCaptureCallback,
      loadEnvFile,
      sourceMapsEnabled,
      arch,
      argv,
      argv0,
      chdir,
      config,
      connected,
      constrainedMemory,
      availableMemory,
      cpuUsage,
      cwd,
      debugPort,
      dlopen,
      disconnect,
      emit,
      emitWarning,
      env,
      eventNames,
      execArgv,
      execPath,
      exit,
      finalization,
      features,
      getBuiltinModule,
      getActiveResourcesInfo,
      getMaxListeners,
      hrtime: hrtime3,
      kill,
      listeners,
      listenerCount,
      memoryUsage,
      nextTick,
      on,
      off,
      once,
      pid,
      platform,
      ppid,
      prependListener,
      prependOnceListener,
      rawListeners,
      release,
      removeAllListeners,
      removeListener,
      report,
      resourceUsage,
      setMaxListeners,
      setSourceMapsEnabled,
      stderr,
      stdin,
      stdout,
      title,
      throwDeprecation,
      traceDeprecation,
      umask,
      uptime,
      version,
      versions,
      // @ts-expect-error old API
      domain,
      initgroups,
      moduleLoadList,
      reallyExit,
      openStdin,
      assert: assert2,
      binding,
      send,
      exitCode,
      channel,
      getegid,
      geteuid,
      getgid,
      getgroups,
      getuid,
      setegid,
      seteuid,
      setgid,
      setgroups,
      setuid,
      permission,
      mainModule,
      _events,
      _eventsCount,
      _exiting,
      _maxListeners,
      _debugEnd,
      _debugProcess,
      _fatalException,
      _getActiveHandles,
      _getActiveRequests,
      _kill,
      _preload_modules,
      _rawDebug,
      _startProfilerIdleNotifier,
      _stopProfilerIdleNotifier,
      _tickCallback,
      _disconnect,
      _handleQueue,
      _pendingMessage,
      _channel,
      _send,
      _linkedBinding
    };
    process_default = _process;
  }
});

// node_modules/wrangler/_virtual_unenv_global_polyfill-@cloudflare-unenv-preset-node-process
var init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process = __esm({
  "node_modules/wrangler/_virtual_unenv_global_polyfill-@cloudflare-unenv-preset-node-process"() {
    init_process2();
    globalThis.process = process_default;
  }
});

// node-built-in-modules:crypto
import libDefault from "crypto";
var require_crypto = __commonJS({
  "node-built-in-modules:crypto"(exports, module) {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    module.exports = libDefault;
  }
});

// node_modules/bcryptjs/dist/bcrypt.js
var require_bcrypt = __commonJS({
  "node_modules/bcryptjs/dist/bcrypt.js"(exports, module) {
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
    init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
    init_performance2();
    (function(global, factory) {
      if (typeof define === "function" && define["amd"])
        define([], factory);
      else if (typeof __require === "function" && typeof module === "object" && module && module["exports"])
        module["exports"] = factory();
      else
        (global["dcodeIO"] = global["dcodeIO"] || {})["bcrypt"] = factory();
    })(exports, function() {
      "use strict";
      var bcrypt2 = {};
      var randomFallback = null;
      function random(len) {
        if (typeof module !== "undefined" && module && module["exports"])
          try {
            return require_crypto()["randomBytes"](len);
          } catch (e) {
          }
        try {
          var a;
          (self["crypto"] || self["msCrypto"])["getRandomValues"](a = new Uint32Array(len));
          return Array.prototype.slice.call(a);
        } catch (e) {
        }
        if (!randomFallback)
          throw Error("Neither WebCryptoAPI nor a crypto module is available. Use bcrypt.setRandomFallback to set an alternative");
        return randomFallback(len);
      }
      __name(random, "random");
      var randomAvailable = false;
      try {
        random(1);
        randomAvailable = true;
      } catch (e) {
      }
      randomFallback = null;
      bcrypt2.setRandomFallback = function(random2) {
        randomFallback = random2;
      };
      bcrypt2.genSaltSync = function(rounds, seed_length) {
        rounds = rounds || GENSALT_DEFAULT_LOG2_ROUNDS;
        if (typeof rounds !== "number")
          throw Error("Illegal arguments: " + typeof rounds + ", " + typeof seed_length);
        if (rounds < 4)
          rounds = 4;
        else if (rounds > 31)
          rounds = 31;
        var salt = [];
        salt.push("$2a$");
        if (rounds < 10)
          salt.push("0");
        salt.push(rounds.toString());
        salt.push("$");
        salt.push(base64_encode(random(BCRYPT_SALT_LEN), BCRYPT_SALT_LEN));
        return salt.join("");
      };
      bcrypt2.genSalt = function(rounds, seed_length, callback) {
        if (typeof seed_length === "function")
          callback = seed_length, seed_length = void 0;
        if (typeof rounds === "function")
          callback = rounds, rounds = void 0;
        if (typeof rounds === "undefined")
          rounds = GENSALT_DEFAULT_LOG2_ROUNDS;
        else if (typeof rounds !== "number")
          throw Error("illegal arguments: " + typeof rounds);
        function _async(callback2) {
          nextTick2(function() {
            try {
              callback2(null, bcrypt2.genSaltSync(rounds));
            } catch (err2) {
              callback2(err2);
            }
          });
        }
        __name(_async, "_async");
        if (callback) {
          if (typeof callback !== "function")
            throw Error("Illegal callback: " + typeof callback);
          _async(callback);
        } else
          return new Promise(function(resolve, reject) {
            _async(function(err2, res) {
              if (err2) {
                reject(err2);
                return;
              }
              resolve(res);
            });
          });
      };
      bcrypt2.hashSync = function(s4, salt) {
        if (typeof salt === "undefined")
          salt = GENSALT_DEFAULT_LOG2_ROUNDS;
        if (typeof salt === "number")
          salt = bcrypt2.genSaltSync(salt);
        if (typeof s4 !== "string" || typeof salt !== "string")
          throw Error("Illegal arguments: " + typeof s4 + ", " + typeof salt);
        return _hash(s4, salt);
      };
      bcrypt2.hash = function(s4, salt, callback, progressCallback) {
        function _async(callback2) {
          if (typeof s4 === "string" && typeof salt === "number")
            bcrypt2.genSalt(salt, function(err2, salt2) {
              _hash(s4, salt2, callback2, progressCallback);
            });
          else if (typeof s4 === "string" && typeof salt === "string")
            _hash(s4, salt, callback2, progressCallback);
          else
            nextTick2(callback2.bind(this, Error("Illegal arguments: " + typeof s4 + ", " + typeof salt)));
        }
        __name(_async, "_async");
        if (callback) {
          if (typeof callback !== "function")
            throw Error("Illegal callback: " + typeof callback);
          _async(callback);
        } else
          return new Promise(function(resolve, reject) {
            _async(function(err2, res) {
              if (err2) {
                reject(err2);
                return;
              }
              resolve(res);
            });
          });
      };
      function safeStringCompare(known, unknown) {
        var right = 0, wrong = 0;
        for (var i = 0, k = known.length; i < k; ++i) {
          if (known.charCodeAt(i) === unknown.charCodeAt(i))
            ++right;
          else
            ++wrong;
        }
        if (right < 0)
          return false;
        return wrong === 0;
      }
      __name(safeStringCompare, "safeStringCompare");
      bcrypt2.compareSync = function(s4, hash) {
        if (typeof s4 !== "string" || typeof hash !== "string")
          throw Error("Illegal arguments: " + typeof s4 + ", " + typeof hash);
        if (hash.length !== 60)
          return false;
        return safeStringCompare(bcrypt2.hashSync(s4, hash.substr(0, hash.length - 31)), hash);
      };
      bcrypt2.compare = function(s4, hash, callback, progressCallback) {
        function _async(callback2) {
          if (typeof s4 !== "string" || typeof hash !== "string") {
            nextTick2(callback2.bind(this, Error("Illegal arguments: " + typeof s4 + ", " + typeof hash)));
            return;
          }
          if (hash.length !== 60) {
            nextTick2(callback2.bind(this, null, false));
            return;
          }
          bcrypt2.hash(s4, hash.substr(0, 29), function(err2, comp) {
            if (err2)
              callback2(err2);
            else
              callback2(null, safeStringCompare(comp, hash));
          }, progressCallback);
        }
        __name(_async, "_async");
        if (callback) {
          if (typeof callback !== "function")
            throw Error("Illegal callback: " + typeof callback);
          _async(callback);
        } else
          return new Promise(function(resolve, reject) {
            _async(function(err2, res) {
              if (err2) {
                reject(err2);
                return;
              }
              resolve(res);
            });
          });
      };
      bcrypt2.getRounds = function(hash) {
        if (typeof hash !== "string")
          throw Error("Illegal arguments: " + typeof hash);
        return parseInt(hash.split("$")[2], 10);
      };
      bcrypt2.getSalt = function(hash) {
        if (typeof hash !== "string")
          throw Error("Illegal arguments: " + typeof hash);
        if (hash.length !== 60)
          throw Error("Illegal hash length: " + hash.length + " != 60");
        return hash.substring(0, 29);
      };
      var nextTick2 = typeof process !== "undefined" && process && typeof process.nextTick === "function" ? typeof setImmediate === "function" ? setImmediate : process.nextTick : setTimeout;
      function stringToBytes(str) {
        var out = [], i = 0;
        utfx.encodeUTF16toUTF8(function() {
          if (i >= str.length) return null;
          return str.charCodeAt(i++);
        }, function(b) {
          out.push(b);
        });
        return out;
      }
      __name(stringToBytes, "stringToBytes");
      var BASE64_CODE = "./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split("");
      var BASE64_INDEX = [
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        0,
        1,
        54,
        55,
        56,
        57,
        58,
        59,
        60,
        61,
        62,
        63,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        28,
        29,
        30,
        31,
        32,
        33,
        34,
        35,
        36,
        37,
        38,
        39,
        40,
        41,
        42,
        43,
        44,
        45,
        46,
        47,
        48,
        49,
        50,
        51,
        52,
        53,
        -1,
        -1,
        -1,
        -1,
        -1
      ];
      var stringFromCharCode = String.fromCharCode;
      function base64_encode(b, len) {
        var off2 = 0, rs = [], c1, c2;
        if (len <= 0 || len > b.length)
          throw Error("Illegal len: " + len);
        while (off2 < len) {
          c1 = b[off2++] & 255;
          rs.push(BASE64_CODE[c1 >> 2 & 63]);
          c1 = (c1 & 3) << 4;
          if (off2 >= len) {
            rs.push(BASE64_CODE[c1 & 63]);
            break;
          }
          c2 = b[off2++] & 255;
          c1 |= c2 >> 4 & 15;
          rs.push(BASE64_CODE[c1 & 63]);
          c1 = (c2 & 15) << 2;
          if (off2 >= len) {
            rs.push(BASE64_CODE[c1 & 63]);
            break;
          }
          c2 = b[off2++] & 255;
          c1 |= c2 >> 6 & 3;
          rs.push(BASE64_CODE[c1 & 63]);
          rs.push(BASE64_CODE[c2 & 63]);
        }
        return rs.join("");
      }
      __name(base64_encode, "base64_encode");
      function base64_decode(s4, len) {
        var off2 = 0, slen = s4.length, olen = 0, rs = [], c1, c2, c3, c4, o, code;
        if (len <= 0)
          throw Error("Illegal len: " + len);
        while (off2 < slen - 1 && olen < len) {
          code = s4.charCodeAt(off2++);
          c1 = code < BASE64_INDEX.length ? BASE64_INDEX[code] : -1;
          code = s4.charCodeAt(off2++);
          c2 = code < BASE64_INDEX.length ? BASE64_INDEX[code] : -1;
          if (c1 == -1 || c2 == -1)
            break;
          o = c1 << 2 >>> 0;
          o |= (c2 & 48) >> 4;
          rs.push(stringFromCharCode(o));
          if (++olen >= len || off2 >= slen)
            break;
          code = s4.charCodeAt(off2++);
          c3 = code < BASE64_INDEX.length ? BASE64_INDEX[code] : -1;
          if (c3 == -1)
            break;
          o = (c2 & 15) << 4 >>> 0;
          o |= (c3 & 60) >> 2;
          rs.push(stringFromCharCode(o));
          if (++olen >= len || off2 >= slen)
            break;
          code = s4.charCodeAt(off2++);
          c4 = code < BASE64_INDEX.length ? BASE64_INDEX[code] : -1;
          o = (c3 & 3) << 6 >>> 0;
          o |= c4;
          rs.push(stringFromCharCode(o));
          ++olen;
        }
        var res = [];
        for (off2 = 0; off2 < olen; off2++)
          res.push(rs[off2].charCodeAt(0));
        return res;
      }
      __name(base64_decode, "base64_decode");
      var utfx = (function() {
        "use strict";
        var utfx2 = {};
        utfx2.MAX_CODEPOINT = 1114111;
        utfx2.encodeUTF8 = function(src, dst) {
          var cp = null;
          if (typeof src === "number")
            cp = src, src = /* @__PURE__ */ __name(function() {
              return null;
            }, "src");
          while (cp !== null || (cp = src()) !== null) {
            if (cp < 128)
              dst(cp & 127);
            else if (cp < 2048)
              dst(cp >> 6 & 31 | 192), dst(cp & 63 | 128);
            else if (cp < 65536)
              dst(cp >> 12 & 15 | 224), dst(cp >> 6 & 63 | 128), dst(cp & 63 | 128);
            else
              dst(cp >> 18 & 7 | 240), dst(cp >> 12 & 63 | 128), dst(cp >> 6 & 63 | 128), dst(cp & 63 | 128);
            cp = null;
          }
        };
        utfx2.decodeUTF8 = function(src, dst) {
          var a, b, c, d, fail4 = /* @__PURE__ */ __name(function(b2) {
            b2 = b2.slice(0, b2.indexOf(null));
            var err2 = Error(b2.toString());
            err2.name = "TruncatedError";
            err2["bytes"] = b2;
            throw err2;
          }, "fail");
          while ((a = src()) !== null) {
            if ((a & 128) === 0)
              dst(a);
            else if ((a & 224) === 192)
              (b = src()) === null && fail4([a, b]), dst((a & 31) << 6 | b & 63);
            else if ((a & 240) === 224)
              ((b = src()) === null || (c = src()) === null) && fail4([a, b, c]), dst((a & 15) << 12 | (b & 63) << 6 | c & 63);
            else if ((a & 248) === 240)
              ((b = src()) === null || (c = src()) === null || (d = src()) === null) && fail4([a, b, c, d]), dst((a & 7) << 18 | (b & 63) << 12 | (c & 63) << 6 | d & 63);
            else throw RangeError("Illegal starting byte: " + a);
          }
        };
        utfx2.UTF16toUTF8 = function(src, dst) {
          var c1, c2 = null;
          while (true) {
            if ((c1 = c2 !== null ? c2 : src()) === null)
              break;
            if (c1 >= 55296 && c1 <= 57343) {
              if ((c2 = src()) !== null) {
                if (c2 >= 56320 && c2 <= 57343) {
                  dst((c1 - 55296) * 1024 + c2 - 56320 + 65536);
                  c2 = null;
                  continue;
                }
              }
            }
            dst(c1);
          }
          if (c2 !== null) dst(c2);
        };
        utfx2.UTF8toUTF16 = function(src, dst) {
          var cp = null;
          if (typeof src === "number")
            cp = src, src = /* @__PURE__ */ __name(function() {
              return null;
            }, "src");
          while (cp !== null || (cp = src()) !== null) {
            if (cp <= 65535)
              dst(cp);
            else
              cp -= 65536, dst((cp >> 10) + 55296), dst(cp % 1024 + 56320);
            cp = null;
          }
        };
        utfx2.encodeUTF16toUTF8 = function(src, dst) {
          utfx2.UTF16toUTF8(src, function(cp) {
            utfx2.encodeUTF8(cp, dst);
          });
        };
        utfx2.decodeUTF8toUTF16 = function(src, dst) {
          utfx2.decodeUTF8(src, function(cp) {
            utfx2.UTF8toUTF16(cp, dst);
          });
        };
        utfx2.calculateCodePoint = function(cp) {
          return cp < 128 ? 1 : cp < 2048 ? 2 : cp < 65536 ? 3 : 4;
        };
        utfx2.calculateUTF8 = function(src) {
          var cp, l = 0;
          while ((cp = src()) !== null)
            l += utfx2.calculateCodePoint(cp);
          return l;
        };
        utfx2.calculateUTF16asUTF8 = function(src) {
          var n = 0, l = 0;
          utfx2.UTF16toUTF8(src, function(cp) {
            ++n;
            l += utfx2.calculateCodePoint(cp);
          });
          return [n, l];
        };
        return utfx2;
      })();
      Date.now = Date.now || function() {
        return +/* @__PURE__ */ new Date();
      };
      var BCRYPT_SALT_LEN = 16;
      var GENSALT_DEFAULT_LOG2_ROUNDS = 10;
      var BLOWFISH_NUM_ROUNDS = 16;
      var MAX_EXECUTION_TIME = 100;
      var P_ORIG = [
        608135816,
        2242054355,
        320440878,
        57701188,
        2752067618,
        698298832,
        137296536,
        3964562569,
        1160258022,
        953160567,
        3193202383,
        887688300,
        3232508343,
        3380367581,
        1065670069,
        3041331479,
        2450970073,
        2306472731
      ];
      var S_ORIG = [
        3509652390,
        2564797868,
        805139163,
        3491422135,
        3101798381,
        1780907670,
        3128725573,
        4046225305,
        614570311,
        3012652279,
        134345442,
        2240740374,
        1667834072,
        1901547113,
        2757295779,
        4103290238,
        227898511,
        1921955416,
        1904987480,
        2182433518,
        2069144605,
        3260701109,
        2620446009,
        720527379,
        3318853667,
        677414384,
        3393288472,
        3101374703,
        2390351024,
        1614419982,
        1822297739,
        2954791486,
        3608508353,
        3174124327,
        2024746970,
        1432378464,
        3864339955,
        2857741204,
        1464375394,
        1676153920,
        1439316330,
        715854006,
        3033291828,
        289532110,
        2706671279,
        2087905683,
        3018724369,
        1668267050,
        732546397,
        1947742710,
        3462151702,
        2609353502,
        2950085171,
        1814351708,
        2050118529,
        680887927,
        999245976,
        1800124847,
        3300911131,
        1713906067,
        1641548236,
        4213287313,
        1216130144,
        1575780402,
        4018429277,
        3917837745,
        3693486850,
        3949271944,
        596196993,
        3549867205,
        258830323,
        2213823033,
        772490370,
        2760122372,
        1774776394,
        2652871518,
        566650946,
        4142492826,
        1728879713,
        2882767088,
        1783734482,
        3629395816,
        2517608232,
        2874225571,
        1861159788,
        326777828,
        3124490320,
        2130389656,
        2716951837,
        967770486,
        1724537150,
        2185432712,
        2364442137,
        1164943284,
        2105845187,
        998989502,
        3765401048,
        2244026483,
        1075463327,
        1455516326,
        1322494562,
        910128902,
        469688178,
        1117454909,
        936433444,
        3490320968,
        3675253459,
        1240580251,
        122909385,
        2157517691,
        634681816,
        4142456567,
        3825094682,
        3061402683,
        2540495037,
        79693498,
        3249098678,
        1084186820,
        1583128258,
        426386531,
        1761308591,
        1047286709,
        322548459,
        995290223,
        1845252383,
        2603652396,
        3431023940,
        2942221577,
        3202600964,
        3727903485,
        1712269319,
        422464435,
        3234572375,
        1170764815,
        3523960633,
        3117677531,
        1434042557,
        442511882,
        3600875718,
        1076654713,
        1738483198,
        4213154764,
        2393238008,
        3677496056,
        1014306527,
        4251020053,
        793779912,
        2902807211,
        842905082,
        4246964064,
        1395751752,
        1040244610,
        2656851899,
        3396308128,
        445077038,
        3742853595,
        3577915638,
        679411651,
        2892444358,
        2354009459,
        1767581616,
        3150600392,
        3791627101,
        3102740896,
        284835224,
        4246832056,
        1258075500,
        768725851,
        2589189241,
        3069724005,
        3532540348,
        1274779536,
        3789419226,
        2764799539,
        1660621633,
        3471099624,
        4011903706,
        913787905,
        3497959166,
        737222580,
        2514213453,
        2928710040,
        3937242737,
        1804850592,
        3499020752,
        2949064160,
        2386320175,
        2390070455,
        2415321851,
        4061277028,
        2290661394,
        2416832540,
        1336762016,
        1754252060,
        3520065937,
        3014181293,
        791618072,
        3188594551,
        3933548030,
        2332172193,
        3852520463,
        3043980520,
        413987798,
        3465142937,
        3030929376,
        4245938359,
        2093235073,
        3534596313,
        375366246,
        2157278981,
        2479649556,
        555357303,
        3870105701,
        2008414854,
        3344188149,
        4221384143,
        3956125452,
        2067696032,
        3594591187,
        2921233993,
        2428461,
        544322398,
        577241275,
        1471733935,
        610547355,
        4027169054,
        1432588573,
        1507829418,
        2025931657,
        3646575487,
        545086370,
        48609733,
        2200306550,
        1653985193,
        298326376,
        1316178497,
        3007786442,
        2064951626,
        458293330,
        2589141269,
        3591329599,
        3164325604,
        727753846,
        2179363840,
        146436021,
        1461446943,
        4069977195,
        705550613,
        3059967265,
        3887724982,
        4281599278,
        3313849956,
        1404054877,
        2845806497,
        146425753,
        1854211946,
        1266315497,
        3048417604,
        3681880366,
        3289982499,
        290971e4,
        1235738493,
        2632868024,
        2414719590,
        3970600049,
        1771706367,
        1449415276,
        3266420449,
        422970021,
        1963543593,
        2690192192,
        3826793022,
        1062508698,
        1531092325,
        1804592342,
        2583117782,
        2714934279,
        4024971509,
        1294809318,
        4028980673,
        1289560198,
        2221992742,
        1669523910,
        35572830,
        157838143,
        1052438473,
        1016535060,
        1802137761,
        1753167236,
        1386275462,
        3080475397,
        2857371447,
        1040679964,
        2145300060,
        2390574316,
        1461121720,
        2956646967,
        4031777805,
        4028374788,
        33600511,
        2920084762,
        1018524850,
        629373528,
        3691585981,
        3515945977,
        2091462646,
        2486323059,
        586499841,
        988145025,
        935516892,
        3367335476,
        2599673255,
        2839830854,
        265290510,
        3972581182,
        2759138881,
        3795373465,
        1005194799,
        847297441,
        406762289,
        1314163512,
        1332590856,
        1866599683,
        4127851711,
        750260880,
        613907577,
        1450815602,
        3165620655,
        3734664991,
        3650291728,
        3012275730,
        3704569646,
        1427272223,
        778793252,
        1343938022,
        2676280711,
        2052605720,
        1946737175,
        3164576444,
        3914038668,
        3967478842,
        3682934266,
        1661551462,
        3294938066,
        4011595847,
        840292616,
        3712170807,
        616741398,
        312560963,
        711312465,
        1351876610,
        322626781,
        1910503582,
        271666773,
        2175563734,
        1594956187,
        70604529,
        3617834859,
        1007753275,
        1495573769,
        4069517037,
        2549218298,
        2663038764,
        504708206,
        2263041392,
        3941167025,
        2249088522,
        1514023603,
        1998579484,
        1312622330,
        694541497,
        2582060303,
        2151582166,
        1382467621,
        776784248,
        2618340202,
        3323268794,
        2497899128,
        2784771155,
        503983604,
        4076293799,
        907881277,
        423175695,
        432175456,
        1378068232,
        4145222326,
        3954048622,
        3938656102,
        3820766613,
        2793130115,
        2977904593,
        26017576,
        3274890735,
        3194772133,
        1700274565,
        1756076034,
        4006520079,
        3677328699,
        720338349,
        1533947780,
        354530856,
        688349552,
        3973924725,
        1637815568,
        332179504,
        3949051286,
        53804574,
        2852348879,
        3044236432,
        1282449977,
        3583942155,
        3416972820,
        4006381244,
        1617046695,
        2628476075,
        3002303598,
        1686838959,
        431878346,
        2686675385,
        1700445008,
        1080580658,
        1009431731,
        832498133,
        3223435511,
        2605976345,
        2271191193,
        2516031870,
        1648197032,
        4164389018,
        2548247927,
        300782431,
        375919233,
        238389289,
        3353747414,
        2531188641,
        2019080857,
        1475708069,
        455242339,
        2609103871,
        448939670,
        3451063019,
        1395535956,
        2413381860,
        1841049896,
        1491858159,
        885456874,
        4264095073,
        4001119347,
        1565136089,
        3898914787,
        1108368660,
        540939232,
        1173283510,
        2745871338,
        3681308437,
        4207628240,
        3343053890,
        4016749493,
        1699691293,
        1103962373,
        3625875870,
        2256883143,
        3830138730,
        1031889488,
        3479347698,
        1535977030,
        4236805024,
        3251091107,
        2132092099,
        1774941330,
        1199868427,
        1452454533,
        157007616,
        2904115357,
        342012276,
        595725824,
        1480756522,
        206960106,
        497939518,
        591360097,
        863170706,
        2375253569,
        3596610801,
        1814182875,
        2094937945,
        3421402208,
        1082520231,
        3463918190,
        2785509508,
        435703966,
        3908032597,
        1641649973,
        2842273706,
        3305899714,
        1510255612,
        2148256476,
        2655287854,
        3276092548,
        4258621189,
        236887753,
        3681803219,
        274041037,
        1734335097,
        3815195456,
        3317970021,
        1899903192,
        1026095262,
        4050517792,
        356393447,
        2410691914,
        3873677099,
        3682840055,
        3913112168,
        2491498743,
        4132185628,
        2489919796,
        1091903735,
        1979897079,
        3170134830,
        3567386728,
        3557303409,
        857797738,
        1136121015,
        1342202287,
        507115054,
        2535736646,
        337727348,
        3213592640,
        1301675037,
        2528481711,
        1895095763,
        1721773893,
        3216771564,
        62756741,
        2142006736,
        835421444,
        2531993523,
        1442658625,
        3659876326,
        2882144922,
        676362277,
        1392781812,
        170690266,
        3921047035,
        1759253602,
        3611846912,
        1745797284,
        664899054,
        1329594018,
        3901205900,
        3045908486,
        2062866102,
        2865634940,
        3543621612,
        3464012697,
        1080764994,
        553557557,
        3656615353,
        3996768171,
        991055499,
        499776247,
        1265440854,
        648242737,
        3940784050,
        980351604,
        3713745714,
        1749149687,
        3396870395,
        4211799374,
        3640570775,
        1161844396,
        3125318951,
        1431517754,
        545492359,
        4268468663,
        3499529547,
        1437099964,
        2702547544,
        3433638243,
        2581715763,
        2787789398,
        1060185593,
        1593081372,
        2418618748,
        4260947970,
        69676912,
        2159744348,
        86519011,
        2512459080,
        3838209314,
        1220612927,
        3339683548,
        133810670,
        1090789135,
        1078426020,
        1569222167,
        845107691,
        3583754449,
        4072456591,
        1091646820,
        628848692,
        1613405280,
        3757631651,
        526609435,
        236106946,
        48312990,
        2942717905,
        3402727701,
        1797494240,
        859738849,
        992217954,
        4005476642,
        2243076622,
        3870952857,
        3732016268,
        765654824,
        3490871365,
        2511836413,
        1685915746,
        3888969200,
        1414112111,
        2273134842,
        3281911079,
        4080962846,
        172450625,
        2569994100,
        980381355,
        4109958455,
        2819808352,
        2716589560,
        2568741196,
        3681446669,
        3329971472,
        1835478071,
        660984891,
        3704678404,
        4045999559,
        3422617507,
        3040415634,
        1762651403,
        1719377915,
        3470491036,
        2693910283,
        3642056355,
        3138596744,
        1364962596,
        2073328063,
        1983633131,
        926494387,
        3423689081,
        2150032023,
        4096667949,
        1749200295,
        3328846651,
        309677260,
        2016342300,
        1779581495,
        3079819751,
        111262694,
        1274766160,
        443224088,
        298511866,
        1025883608,
        3806446537,
        1145181785,
        168956806,
        3641502830,
        3584813610,
        1689216846,
        3666258015,
        3200248200,
        1692713982,
        2646376535,
        4042768518,
        1618508792,
        1610833997,
        3523052358,
        4130873264,
        2001055236,
        3610705100,
        2202168115,
        4028541809,
        2961195399,
        1006657119,
        2006996926,
        3186142756,
        1430667929,
        3210227297,
        1314452623,
        4074634658,
        4101304120,
        2273951170,
        1399257539,
        3367210612,
        3027628629,
        1190975929,
        2062231137,
        2333990788,
        2221543033,
        2438960610,
        1181637006,
        548689776,
        2362791313,
        3372408396,
        3104550113,
        3145860560,
        296247880,
        1970579870,
        3078560182,
        3769228297,
        1714227617,
        3291629107,
        3898220290,
        166772364,
        1251581989,
        493813264,
        448347421,
        195405023,
        2709975567,
        677966185,
        3703036547,
        1463355134,
        2715995803,
        1338867538,
        1343315457,
        2802222074,
        2684532164,
        233230375,
        2599980071,
        2000651841,
        3277868038,
        1638401717,
        4028070440,
        3237316320,
        6314154,
        819756386,
        300326615,
        590932579,
        1405279636,
        3267499572,
        3150704214,
        2428286686,
        3959192993,
        3461946742,
        1862657033,
        1266418056,
        963775037,
        2089974820,
        2263052895,
        1917689273,
        448879540,
        3550394620,
        3981727096,
        150775221,
        3627908307,
        1303187396,
        508620638,
        2975983352,
        2726630617,
        1817252668,
        1876281319,
        1457606340,
        908771278,
        3720792119,
        3617206836,
        2455994898,
        1729034894,
        1080033504,
        976866871,
        3556439503,
        2881648439,
        1522871579,
        1555064734,
        1336096578,
        3548522304,
        2579274686,
        3574697629,
        3205460757,
        3593280638,
        3338716283,
        3079412587,
        564236357,
        2993598910,
        1781952180,
        1464380207,
        3163844217,
        3332601554,
        1699332808,
        1393555694,
        1183702653,
        3581086237,
        1288719814,
        691649499,
        2847557200,
        2895455976,
        3193889540,
        2717570544,
        1781354906,
        1676643554,
        2592534050,
        3230253752,
        1126444790,
        2770207658,
        2633158820,
        2210423226,
        2615765581,
        2414155088,
        3127139286,
        673620729,
        2805611233,
        1269405062,
        4015350505,
        3341807571,
        4149409754,
        1057255273,
        2012875353,
        2162469141,
        2276492801,
        2601117357,
        993977747,
        3918593370,
        2654263191,
        753973209,
        36408145,
        2530585658,
        25011837,
        3520020182,
        2088578344,
        530523599,
        2918365339,
        1524020338,
        1518925132,
        3760827505,
        3759777254,
        1202760957,
        3985898139,
        3906192525,
        674977740,
        4174734889,
        2031300136,
        2019492241,
        3983892565,
        4153806404,
        3822280332,
        352677332,
        2297720250,
        60907813,
        90501309,
        3286998549,
        1016092578,
        2535922412,
        2839152426,
        457141659,
        509813237,
        4120667899,
        652014361,
        1966332200,
        2975202805,
        55981186,
        2327461051,
        676427537,
        3255491064,
        2882294119,
        3433927263,
        1307055953,
        942726286,
        933058658,
        2468411793,
        3933900994,
        4215176142,
        1361170020,
        2001714738,
        2830558078,
        3274259782,
        1222529897,
        1679025792,
        2729314320,
        3714953764,
        1770335741,
        151462246,
        3013232138,
        1682292957,
        1483529935,
        471910574,
        1539241949,
        458788160,
        3436315007,
        1807016891,
        3718408830,
        978976581,
        1043663428,
        3165965781,
        1927990952,
        4200891579,
        2372276910,
        3208408903,
        3533431907,
        1412390302,
        2931980059,
        4132332400,
        1947078029,
        3881505623,
        4168226417,
        2941484381,
        1077988104,
        1320477388,
        886195818,
        18198404,
        3786409e3,
        2509781533,
        112762804,
        3463356488,
        1866414978,
        891333506,
        18488651,
        661792760,
        1628790961,
        3885187036,
        3141171499,
        876946877,
        2693282273,
        1372485963,
        791857591,
        2686433993,
        3759982718,
        3167212022,
        3472953795,
        2716379847,
        445679433,
        3561995674,
        3504004811,
        3574258232,
        54117162,
        3331405415,
        2381918588,
        3769707343,
        4154350007,
        1140177722,
        4074052095,
        668550556,
        3214352940,
        367459370,
        261225585,
        2610173221,
        4209349473,
        3468074219,
        3265815641,
        314222801,
        3066103646,
        3808782860,
        282218597,
        3406013506,
        3773591054,
        379116347,
        1285071038,
        846784868,
        2669647154,
        3771962079,
        3550491691,
        2305946142,
        453669953,
        1268987020,
        3317592352,
        3279303384,
        3744833421,
        2610507566,
        3859509063,
        266596637,
        3847019092,
        517658769,
        3462560207,
        3443424879,
        370717030,
        4247526661,
        2224018117,
        4143653529,
        4112773975,
        2788324899,
        2477274417,
        1456262402,
        2901442914,
        1517677493,
        1846949527,
        2295493580,
        3734397586,
        2176403920,
        1280348187,
        1908823572,
        3871786941,
        846861322,
        1172426758,
        3287448474,
        3383383037,
        1655181056,
        3139813346,
        901632758,
        1897031941,
        2986607138,
        3066810236,
        3447102507,
        1393639104,
        373351379,
        950779232,
        625454576,
        3124240540,
        4148612726,
        2007998917,
        544563296,
        2244738638,
        2330496472,
        2058025392,
        1291430526,
        424198748,
        50039436,
        29584100,
        3605783033,
        2429876329,
        2791104160,
        1057563949,
        3255363231,
        3075367218,
        3463963227,
        1469046755,
        985887462
      ];
      var C_ORIG = [
        1332899944,
        1700884034,
        1701343084,
        1684370003,
        1668446532,
        1869963892
      ];
      function _encipher(lr, off2, P, S) {
        var n, l = lr[off2], r = lr[off2 + 1];
        l ^= P[0];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[1];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[2];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[3];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[4];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[5];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[6];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[7];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[8];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[9];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[10];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[11];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[12];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[13];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[14];
        n = S[l >>> 24];
        n += S[256 | l >> 16 & 255];
        n ^= S[512 | l >> 8 & 255];
        n += S[768 | l & 255];
        r ^= n ^ P[15];
        n = S[r >>> 24];
        n += S[256 | r >> 16 & 255];
        n ^= S[512 | r >> 8 & 255];
        n += S[768 | r & 255];
        l ^= n ^ P[16];
        lr[off2] = r ^ P[BLOWFISH_NUM_ROUNDS + 1];
        lr[off2 + 1] = l;
        return lr;
      }
      __name(_encipher, "_encipher");
      function _streamtoword(data, offp) {
        for (var i = 0, word = 0; i < 4; ++i)
          word = word << 8 | data[offp] & 255, offp = (offp + 1) % data.length;
        return { key: word, offp };
      }
      __name(_streamtoword, "_streamtoword");
      function _key(key, P, S) {
        var offset = 0, lr = [0, 0], plen = P.length, slen = S.length, sw;
        for (var i = 0; i < plen; i++)
          sw = _streamtoword(key, offset), offset = sw.offp, P[i] = P[i] ^ sw.key;
        for (i = 0; i < plen; i += 2)
          lr = _encipher(lr, 0, P, S), P[i] = lr[0], P[i + 1] = lr[1];
        for (i = 0; i < slen; i += 2)
          lr = _encipher(lr, 0, P, S), S[i] = lr[0], S[i + 1] = lr[1];
      }
      __name(_key, "_key");
      function _ekskey(data, key, P, S) {
        var offp = 0, lr = [0, 0], plen = P.length, slen = S.length, sw;
        for (var i = 0; i < plen; i++)
          sw = _streamtoword(key, offp), offp = sw.offp, P[i] = P[i] ^ sw.key;
        offp = 0;
        for (i = 0; i < plen; i += 2)
          sw = _streamtoword(data, offp), offp = sw.offp, lr[0] ^= sw.key, sw = _streamtoword(data, offp), offp = sw.offp, lr[1] ^= sw.key, lr = _encipher(lr, 0, P, S), P[i] = lr[0], P[i + 1] = lr[1];
        for (i = 0; i < slen; i += 2)
          sw = _streamtoword(data, offp), offp = sw.offp, lr[0] ^= sw.key, sw = _streamtoword(data, offp), offp = sw.offp, lr[1] ^= sw.key, lr = _encipher(lr, 0, P, S), S[i] = lr[0], S[i + 1] = lr[1];
      }
      __name(_ekskey, "_ekskey");
      function _crypt(b, salt, rounds, callback, progressCallback) {
        var cdata = C_ORIG.slice(), clen = cdata.length, err2;
        if (rounds < 4 || rounds > 31) {
          err2 = Error("Illegal number of rounds (4-31): " + rounds);
          if (callback) {
            nextTick2(callback.bind(this, err2));
            return;
          } else
            throw err2;
        }
        if (salt.length !== BCRYPT_SALT_LEN) {
          err2 = Error("Illegal salt length: " + salt.length + " != " + BCRYPT_SALT_LEN);
          if (callback) {
            nextTick2(callback.bind(this, err2));
            return;
          } else
            throw err2;
        }
        rounds = 1 << rounds >>> 0;
        var P, S, i = 0, j;
        if (Int32Array) {
          P = new Int32Array(P_ORIG);
          S = new Int32Array(S_ORIG);
        } else {
          P = P_ORIG.slice();
          S = S_ORIG.slice();
        }
        _ekskey(salt, b, P, S);
        function next() {
          if (progressCallback)
            progressCallback(i / rounds);
          if (i < rounds) {
            var start = Date.now();
            for (; i < rounds; ) {
              i = i + 1;
              _key(b, P, S);
              _key(salt, P, S);
              if (Date.now() - start > MAX_EXECUTION_TIME)
                break;
            }
          } else {
            for (i = 0; i < 64; i++)
              for (j = 0; j < clen >> 1; j++)
                _encipher(cdata, j << 1, P, S);
            var ret = [];
            for (i = 0; i < clen; i++)
              ret.push((cdata[i] >> 24 & 255) >>> 0), ret.push((cdata[i] >> 16 & 255) >>> 0), ret.push((cdata[i] >> 8 & 255) >>> 0), ret.push((cdata[i] & 255) >>> 0);
            if (callback) {
              callback(null, ret);
              return;
            } else
              return ret;
          }
          if (callback)
            nextTick2(next);
        }
        __name(next, "next");
        if (typeof callback !== "undefined") {
          next();
        } else {
          var res;
          while (true)
            if (typeof (res = next()) !== "undefined")
              return res || [];
        }
      }
      __name(_crypt, "_crypt");
      function _hash(s4, salt, callback, progressCallback) {
        var err2;
        if (typeof s4 !== "string" || typeof salt !== "string") {
          err2 = Error("Invalid string / salt: Not a string");
          if (callback) {
            nextTick2(callback.bind(this, err2));
            return;
          } else
            throw err2;
        }
        var minor, offset;
        if (salt.charAt(0) !== "$" || salt.charAt(1) !== "2") {
          err2 = Error("Invalid salt version: " + salt.substring(0, 2));
          if (callback) {
            nextTick2(callback.bind(this, err2));
            return;
          } else
            throw err2;
        }
        if (salt.charAt(2) === "$")
          minor = String.fromCharCode(0), offset = 3;
        else {
          minor = salt.charAt(2);
          if (minor !== "a" && minor !== "b" && minor !== "y" || salt.charAt(3) !== "$") {
            err2 = Error("Invalid salt revision: " + salt.substring(2, 4));
            if (callback) {
              nextTick2(callback.bind(this, err2));
              return;
            } else
              throw err2;
          }
          offset = 4;
        }
        if (salt.charAt(offset + 2) > "$") {
          err2 = Error("Missing salt rounds");
          if (callback) {
            nextTick2(callback.bind(this, err2));
            return;
          } else
            throw err2;
        }
        var r1 = parseInt(salt.substring(offset, offset + 1), 10) * 10, r2 = parseInt(salt.substring(offset + 1, offset + 2), 10), rounds = r1 + r2, real_salt = salt.substring(offset + 3, offset + 25);
        s4 += minor >= "a" ? "\0" : "";
        var passwordb = stringToBytes(s4), saltb = base64_decode(real_salt, BCRYPT_SALT_LEN);
        function finish(bytes) {
          var res = [];
          res.push("$2");
          if (minor >= "a")
            res.push(minor);
          res.push("$");
          if (rounds < 10)
            res.push("0");
          res.push(rounds.toString());
          res.push("$");
          res.push(base64_encode(saltb, saltb.length));
          res.push(base64_encode(bytes, C_ORIG.length * 4 - 1));
          return res.join("");
        }
        __name(finish, "finish");
        if (typeof callback == "undefined")
          return finish(_crypt(passwordb, saltb, rounds));
        else {
          _crypt(passwordb, saltb, rounds, function(err3, bytes) {
            if (err3)
              callback(err3, null);
            else
              callback(null, finish(bytes));
          }, progressCallback);
        }
      }
      __name(_hash, "_hash");
      bcrypt2.encodeBase64 = base64_encode;
      bcrypt2.decodeBase64 = base64_decode;
      return bcrypt2;
    });
  }
});

// src/index.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// src/app.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/index.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/hono.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/hono-base.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/compose.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var compose = /* @__PURE__ */ __name((middleware, onError, onNotFound) => {
  return (context2, next) => {
    let index = -1;
    return dispatch2(0);
    async function dispatch2(i) {
      if (i <= index) {
        throw new Error("next() called multiple times");
      }
      index = i;
      let res;
      let isError = false;
      let handler;
      if (middleware[i]) {
        handler = middleware[i][0][0];
        context2.req.routeIndex = i;
      } else {
        handler = i === middleware.length && next || void 0;
      }
      if (handler) {
        try {
          res = await handler(context2, () => dispatch2(i + 1));
        } catch (err2) {
          if (err2 instanceof Error && onError) {
            context2.error = err2;
            res = await onError(err2, context2);
            isError = true;
          } else {
            throw err2;
          }
        }
      } else {
        if (context2.finalized === false && onNotFound) {
          res = await onNotFound(context2);
        }
      }
      if (res && (context2.finalized === false || isError)) {
        context2.res = res;
      }
      return context2;
    }
    __name(dispatch2, "dispatch");
  };
}, "compose");

// node_modules/hono/dist/context.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/request.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/http-exception.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/request/constants.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var GET_MATCH_RESULT = /* @__PURE__ */ Symbol();

// node_modules/hono/dist/utils/body.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/utils/buffer.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/utils/crypto.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/utils/buffer.js
var bufferToFormData = /* @__PURE__ */ __name((arrayBuffer, contentType) => {
  const response = new Response(arrayBuffer, {
    headers: {
      // Normalize the media type (case-insensitive) while keeping parameters like the boundary
      "Content-Type": contentType.replace(/^[^;]+/, (mediaType) => mediaType.toLowerCase())
    }
  });
  return response.formData();
}, "bufferToFormData");

// node_modules/hono/dist/utils/body.js
var isRawRequest = /* @__PURE__ */ __name((request) => "headers" in request, "isRawRequest");
var parseBody = /* @__PURE__ */ __name(async (request, options = /* @__PURE__ */ Object.create(null)) => {
  const { all: all3 = false, dot = false } = options;
  const headers = isRawRequest(request) ? request.headers : request.raw.headers;
  const contentType = headers.get("Content-Type");
  const mediaType = contentType?.split(";")[0].trim().toLowerCase();
  if (mediaType === "multipart/form-data" || mediaType === "application/x-www-form-urlencoded") {
    return parseFormData(request, { all: all3, dot });
  }
  return {};
}, "parseBody");
async function parseFormData(request, options) {
  if (!isRawRequest(request) && request.bodyCache.formData) {
    return convertFormDataToBodyData(
      await request.bodyCache.formData,
      options
    );
  }
  const headers = isRawRequest(request) ? request.headers : request.raw.headers;
  const arrayBuffer = await request.arrayBuffer();
  const formDataPromise = bufferToFormData(arrayBuffer, headers.get("Content-Type") || "");
  if (!isRawRequest(request)) {
    request.bodyCache.formData = formDataPromise;
  }
  const formData = await formDataPromise;
  if (formData) {
    return convertFormDataToBodyData(formData, options);
  }
  return {};
}
__name(parseFormData, "parseFormData");
function convertFormDataToBodyData(formData, options) {
  const form = /* @__PURE__ */ Object.create(null);
  formData.forEach((value, key) => {
    const shouldParseAllValues = options.all || key.endsWith("[]");
    if (!shouldParseAllValues) {
      form[key] = value;
    } else {
      handleParsingAllValues(form, key, value);
    }
  });
  if (options.dot) {
    Object.entries(form).forEach(([key, value]) => {
      const shouldParseDotValues = key.includes(".");
      if (shouldParseDotValues) {
        handleParsingNestedValues(form, key, value);
        delete form[key];
      }
    });
  }
  return form;
}
__name(convertFormDataToBodyData, "convertFormDataToBodyData");
var handleParsingAllValues = /* @__PURE__ */ __name((form, key, value) => {
  if (form[key] !== void 0) {
    if (Array.isArray(form[key])) {
      ;
      form[key].push(value);
    } else {
      form[key] = [form[key], value];
    }
  } else {
    if (!key.endsWith("[]")) {
      form[key] = value;
    } else {
      form[key] = [value];
    }
  }
}, "handleParsingAllValues");
var handleParsingNestedValues = /* @__PURE__ */ __name((form, key, value) => {
  if (/(?:^|\.)__proto__\./.test(key)) {
    return;
  }
  let nestedForm = form;
  const keys = key.split(".");
  keys.forEach((key2, index) => {
    if (index === keys.length - 1) {
      nestedForm[key2] = value;
    } else {
      if (!nestedForm[key2] || typeof nestedForm[key2] !== "object" || Array.isArray(nestedForm[key2]) || nestedForm[key2] instanceof File) {
        nestedForm[key2] = /* @__PURE__ */ Object.create(null);
      }
      nestedForm = nestedForm[key2];
    }
  });
}, "handleParsingNestedValues");

// node_modules/hono/dist/utils/url.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var splitPath = /* @__PURE__ */ __name((path) => {
  const paths = path.split("/");
  if (paths[0] === "") {
    paths.shift();
  }
  return paths;
}, "splitPath");
var splitRoutingPath = /* @__PURE__ */ __name((routePath) => {
  const { groups, path } = extractGroupsFromPath(routePath);
  const paths = splitPath(path);
  return replaceGroupMarks(paths, groups);
}, "splitRoutingPath");
var extractGroupsFromPath = /* @__PURE__ */ __name((path) => {
  const groups = [];
  path = path.replace(/\{[^}]+\}/g, (match2, index) => {
    const mark = `@${index}`;
    groups.push([mark, match2]);
    return mark;
  });
  return { groups, path };
}, "extractGroupsFromPath");
var replaceGroupMarks = /* @__PURE__ */ __name((paths, groups) => {
  for (let i = groups.length - 1; i >= 0; i--) {
    const [mark] = groups[i];
    for (let j = paths.length - 1; j >= 0; j--) {
      if (paths[j].includes(mark)) {
        paths[j] = paths[j].replace(mark, groups[i][1]);
        break;
      }
    }
  }
  return paths;
}, "replaceGroupMarks");
var patternCache = {};
var getPattern = /* @__PURE__ */ __name((label, next) => {
  if (label === "*") {
    return "*";
  }
  const match2 = label.match(/^\:([^\{\}]+)(?:\{(.+)\})?$/);
  if (match2) {
    const cacheKey = `${label}#${next}`;
    if (!patternCache[cacheKey]) {
      if (match2[2]) {
        patternCache[cacheKey] = next && next[0] !== ":" && next[0] !== "*" ? [cacheKey, match2[1], new RegExp(`^${match2[2]}(?=/${next})`)] : [label, match2[1], new RegExp(`^${match2[2]}$`)];
      } else {
        patternCache[cacheKey] = [label, match2[1], true];
      }
    }
    return patternCache[cacheKey];
  }
  return null;
}, "getPattern");
var tryDecode = /* @__PURE__ */ __name((str, decoder) => {
  try {
    return decoder(str);
  } catch {
    return str.replace(/(?:%[0-9A-Fa-f]{2})+/g, (match2) => {
      try {
        return decoder(match2);
      } catch {
        return match2;
      }
    });
  }
}, "tryDecode");
var tryDecodeURI = /* @__PURE__ */ __name((str) => tryDecode(str, decodeURI), "tryDecodeURI");
var getPath = /* @__PURE__ */ __name((request) => {
  const url = request.url;
  const start = url.indexOf("/", url.indexOf(":") + 4);
  let i = start;
  for (; i < url.length; i++) {
    const charCode = url.charCodeAt(i);
    if (charCode === 37) {
      const queryIndex = url.indexOf("?", i);
      const hashIndex = url.indexOf("#", i);
      const end = queryIndex === -1 ? hashIndex === -1 ? void 0 : hashIndex : hashIndex === -1 ? queryIndex : Math.min(queryIndex, hashIndex);
      const path = url.slice(start, end);
      return tryDecodeURI(path.includes("%25") ? path.replace(/%25/g, "%2525") : path);
    } else if (charCode === 63 || charCode === 35) {
      break;
    }
  }
  return url.slice(start, i);
}, "getPath");
var getPathNoStrict = /* @__PURE__ */ __name((request) => {
  const result = getPath(request);
  return result.length > 1 && result.at(-1) === "/" ? result.slice(0, -1) : result;
}, "getPathNoStrict");
var mergePath = /* @__PURE__ */ __name((base, sub, ...rest) => {
  if (rest.length) {
    sub = mergePath(sub, ...rest);
  }
  return `${base?.[0] === "/" ? "" : "/"}${base}${sub === "/" ? "" : `${base?.at(-1) === "/" ? "" : "/"}${sub?.[0] === "/" ? sub.slice(1) : sub}`}`;
}, "mergePath");
var checkOptionalParameter = /* @__PURE__ */ __name((path) => {
  if (path.charCodeAt(path.length - 1) !== 63 || !path.includes(":")) {
    return null;
  }
  const segments = path.split("/");
  const results = [];
  let basePath = "";
  segments.forEach((segment) => {
    if (segment !== "" && !/\:/.test(segment)) {
      basePath += "/" + segment;
    } else if (/\:/.test(segment)) {
      if (/\?/.test(segment)) {
        if (results.length === 0 && basePath === "") {
          results.push("/");
        } else {
          results.push(basePath);
        }
        const optionalSegment = segment.replace("?", "");
        basePath += "/" + optionalSegment;
        results.push(basePath);
      } else {
        basePath += "/" + segment;
      }
    }
  });
  return results.filter((v, i, a) => a.indexOf(v) === i);
}, "checkOptionalParameter");
var tryDecodeURIComponent = /* @__PURE__ */ __name((str) => str.indexOf("%") !== -1 ? tryDecode(str, decodeURIComponent_) : str, "tryDecodeURIComponent");
var _decodeURI = /* @__PURE__ */ __name((value) => {
  if (value.indexOf("+") !== -1) {
    value = value.replace(/\+/g, " ");
  }
  return tryDecodeURIComponent(value);
}, "_decodeURI");
var _getQueryParam = /* @__PURE__ */ __name((url, key, multiple) => {
  let encoded;
  if (!multiple && key && key.indexOf("%") === -1 && key.indexOf("+") === -1) {
    let keyIndex2 = url.indexOf("?", 8);
    if (keyIndex2 === -1) {
      return void 0;
    }
    if (!url.startsWith(key, keyIndex2 + 1)) {
      keyIndex2 = url.indexOf(`&${key}`, keyIndex2 + 1);
    }
    while (keyIndex2 !== -1) {
      const trailingKeyCode = url.charCodeAt(keyIndex2 + key.length + 1);
      if (trailingKeyCode === 61) {
        const valueIndex = keyIndex2 + key.length + 2;
        const endIndex = url.indexOf("&", valueIndex);
        return _decodeURI(url.slice(valueIndex, endIndex === -1 ? void 0 : endIndex));
      } else if (trailingKeyCode == 38 || isNaN(trailingKeyCode)) {
        return "";
      }
      keyIndex2 = url.indexOf(`&${key}`, keyIndex2 + 1);
    }
    encoded = /[%+]/.test(url);
    if (!encoded) {
      return void 0;
    }
  }
  const results = /* @__PURE__ */ Object.create(null);
  encoded ??= /[%+]/.test(url);
  let keyIndex = url.indexOf("?", 8);
  while (keyIndex !== -1) {
    const nextKeyIndex = url.indexOf("&", keyIndex + 1);
    let valueIndex = url.indexOf("=", keyIndex);
    if (valueIndex > nextKeyIndex && nextKeyIndex !== -1) {
      valueIndex = -1;
    }
    let name = url.slice(
      keyIndex + 1,
      valueIndex === -1 ? nextKeyIndex === -1 ? void 0 : nextKeyIndex : valueIndex
    );
    if (encoded) {
      name = _decodeURI(name);
    }
    keyIndex = nextKeyIndex;
    if (name === "") {
      continue;
    }
    let value;
    if (valueIndex === -1) {
      value = "";
    } else {
      value = url.slice(valueIndex + 1, nextKeyIndex === -1 ? void 0 : nextKeyIndex);
      if (encoded) {
        value = _decodeURI(value);
      }
    }
    if (multiple) {
      if (!(results[name] && Array.isArray(results[name]))) {
        results[name] = [];
      }
      ;
      results[name].push(value);
    } else {
      results[name] ??= value;
    }
  }
  return key ? results[key] : results;
}, "_getQueryParam");
var getQueryParam = _getQueryParam;
var getQueryParams = /* @__PURE__ */ __name((url, key) => {
  return _getQueryParam(url, key, true);
}, "getQueryParams");
var decodeURIComponent_ = decodeURIComponent;

// node_modules/hono/dist/request.js
var HonoRequest = class {
  static {
    __name(this, "HonoRequest");
  }
  /**
   * `.raw` can get the raw Request object.
   *
   * @see {@link https://hono.dev/docs/api/request#raw}
   *
   * @example
   * ```ts
   * // For Cloudflare Workers
   * app.post('/', async (c) => {
   *   const metadata = c.req.raw.cf?.hostMetadata?
   *   ...
   * })
   * ```
   */
  raw;
  #validatedData;
  // Short name of validatedData
  #matchResult;
  routeIndex = 0;
  /**
   * `.path` can get the pathname of the request.
   *
   * @see {@link https://hono.dev/docs/api/request#path}
   *
   * @example
   * ```ts
   * app.get('/about/me', (c) => {
   *   const pathname = c.req.path // `/about/me`
   * })
   * ```
   */
  path;
  bodyCache = {};
  constructor(request, path = "/", matchResult = [[]]) {
    this.raw = request;
    this.path = path;
    this.#matchResult = matchResult;
  }
  param(key) {
    return key ? this.#getDecodedParam(key) : this.#getAllDecodedParams();
  }
  #getDecodedParam(key) {
    const paramKey = this.#matchResult[0][this.routeIndex][1][key];
    const param = this.#getParamValue(paramKey);
    return param && tryDecodeURIComponent(param);
  }
  #getAllDecodedParams() {
    const decoded = {};
    const keys = Object.keys(this.#matchResult[0][this.routeIndex][1]);
    for (const key of keys) {
      const value = this.#getParamValue(this.#matchResult[0][this.routeIndex][1][key]);
      if (value !== void 0) {
        decoded[key] = tryDecodeURIComponent(value);
      }
    }
    return decoded;
  }
  #getParamValue(paramKey) {
    return this.#matchResult[1] ? this.#matchResult[1][paramKey] : paramKey;
  }
  query(key) {
    return getQueryParam(this.url, key);
  }
  queries(key) {
    return getQueryParams(this.url, key);
  }
  header(name) {
    if (name) {
      return this.raw.headers.get(name) ?? void 0;
    }
    const headerData = /* @__PURE__ */ Object.create(null);
    this.raw.headers.forEach((value, key) => {
      headerData[key] = value;
    });
    return headerData;
  }
  async parseBody(options) {
    return parseBody(this, options);
  }
  #cachedBody = /* @__PURE__ */ __name((key) => {
    const { bodyCache, raw: raw2 } = this;
    const cachedBody = bodyCache[key];
    if (cachedBody) {
      return cachedBody;
    }
    for (const anyCachedKey in bodyCache) {
      return bodyCache[anyCachedKey].then((body) => {
        if (anyCachedKey === "json") {
          body = JSON.stringify(body);
        }
        return new Response(body)[key]();
      });
    }
    return bodyCache[key] = raw2[key]();
  }, "#cachedBody");
  /**
   * `.json()` can parse Request body of type `application/json`
   *
   * @see {@link https://hono.dev/docs/api/request#json}
   *
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.json()
   * })
   * ```
   */
  json() {
    return this.#cachedBody("text").then((text) => JSON.parse(text));
  }
  /**
   * `.text()` can parse Request body of type `text/plain`
   *
   * @see {@link https://hono.dev/docs/api/request#text}
   *
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.text()
   * })
   * ```
   */
  text() {
    return this.#cachedBody("text");
  }
  /**
   * `.arrayBuffer()` parse Request body as an `ArrayBuffer`
   *
   * @see {@link https://hono.dev/docs/api/request#arraybuffer}
   *
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.arrayBuffer()
   * })
   * ```
   */
  arrayBuffer() {
    return this.#cachedBody("arrayBuffer");
  }
  /**
   * `.bytes()` parses the request body as a `Uint8Array`.
   *
   * @see {@link https://hono.dev/docs/api/request#bytes}
   *
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.bytes()
   * })
   * ```
   */
  bytes() {
    return this.#cachedBody("arrayBuffer").then((buffer) => new Uint8Array(buffer));
  }
  /**
   * Parses the request body as a `Blob`.
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.blob();
   * });
   * ```
   * @see https://hono.dev/docs/api/request#blob
   */
  blob() {
    return this.#cachedBody("blob");
  }
  /**
   * Parses the request body as `FormData`.
   * @example
   * ```ts
   * app.post('/entry', async (c) => {
   *   const body = await c.req.formData();
   * });
   * ```
   * @see https://hono.dev/docs/api/request#formdata
   */
  formData() {
    return this.#cachedBody("formData");
  }
  /**
   * Adds validated data to the request.
   *
   * @param target - The target of the validation.
   * @param data - The validated data to add.
   */
  addValidatedData(target, data) {
    ;
    (this.#validatedData ??= {})[target] = data;
  }
  valid(target) {
    return this.#validatedData?.[target];
  }
  /**
   * `.url()` can get the request url strings.
   *
   * @see {@link https://hono.dev/docs/api/request#url}
   *
   * @example
   * ```ts
   * app.get('/about/me', (c) => {
   *   const url = c.req.url // `http://localhost:8787/about/me`
   *   ...
   * })
   * ```
   */
  get url() {
    return this.raw.url;
  }
  /**
   * `.method()` can get the method name of the request.
   *
   * @see {@link https://hono.dev/docs/api/request#method}
   *
   * @example
   * ```ts
   * app.get('/about/me', (c) => {
   *   const method = c.req.method // `GET`
   * })
   * ```
   */
  get method() {
    return this.raw.method;
  }
  get [GET_MATCH_RESULT]() {
    return this.#matchResult;
  }
  /**
   * `.matchedRoutes()` can return a matched route in the handler
   *
   * @deprecated
   *
   * Use matchedRoutes helper defined in "hono/route" instead.
   *
   * @see {@link https://hono.dev/docs/api/request#matchedroutes}
   *
   * @example
   * ```ts
   * app.use('*', async function logger(c, next) {
   *   await next()
   *   c.req.matchedRoutes.forEach(({ handler, method, path }, i) => {
   *     const name = handler.name || (handler.length < 2 ? '[handler]' : '[middleware]')
   *     console.log(
   *       method,
   *       ' ',
   *       path,
   *       ' '.repeat(Math.max(10 - path.length, 0)),
   *       name,
   *       i === c.req.routeIndex ? '<- respond from here' : ''
   *     )
   *   })
   * })
   * ```
   */
  get matchedRoutes() {
    return this.#matchResult[0].map(([[, route]]) => route);
  }
  /**
   * `routePath()` can retrieve the path registered within the handler
   *
   * @deprecated
   *
   * Use routePath helper defined in "hono/route" instead.
   *
   * @see {@link https://hono.dev/docs/api/request#routepath}
   *
   * @example
   * ```ts
   * app.get('/posts/:id', (c) => {
   *   return c.json({ path: c.req.routePath })
   * })
   * ```
   */
  get routePath() {
    return this.#matchResult[0].map(([[, route]]) => route)[this.routeIndex].path;
  }
};

// node_modules/hono/dist/utils/html.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var HtmlEscapedCallbackPhase = {
  Stringify: 1,
  BeforeStream: 2,
  Stream: 3
};
var raw = /* @__PURE__ */ __name((value, callbacks) => {
  const escapedString = new String(value);
  escapedString.isEscaped = true;
  escapedString.callbacks = callbacks;
  return escapedString;
}, "raw");
var resolveCallback = /* @__PURE__ */ __name(async (str, phase, preserveCallbacks, context2, buffer) => {
  if (typeof str === "object" && !(str instanceof String)) {
    if (!(str instanceof Promise)) {
      str = str.toString();
    }
    if (str instanceof Promise) {
      str = await str;
    }
  }
  const callbacks = str.callbacks;
  if (!callbacks?.length) {
    return Promise.resolve(str);
  }
  if (buffer) {
    buffer[0] += str;
  } else {
    buffer = [str];
  }
  const resStr = Promise.all(callbacks.map((c) => c({ phase, buffer, context: context2 }))).then(
    (res) => Promise.all(
      res.filter(Boolean).map((str2) => resolveCallback(str2, phase, false, context2, buffer))
    ).then(() => buffer[0])
  );
  if (preserveCallbacks) {
    return raw(await resStr, callbacks);
  } else {
    return resStr;
  }
}, "resolveCallback");

// node_modules/hono/dist/context.js
var TEXT_PLAIN = "text/plain; charset=UTF-8";
var setDefaultContentType = /* @__PURE__ */ __name((contentType, headers) => {
  return {
    "Content-Type": contentType,
    ...headers
  };
}, "setDefaultContentType");
var createResponseInstance = /* @__PURE__ */ __name((body, init) => new Response(body, init), "createResponseInstance");
var Context = class {
  static {
    __name(this, "Context");
  }
  #rawRequest;
  #req;
  /**
   * `.env` can get bindings (environment variables, secrets, KV namespaces, D1 database, R2 bucket etc.) in Cloudflare Workers.
   *
   * @see {@link https://hono.dev/docs/api/context#env}
   *
   * @example
   * ```ts
   * // Environment object for Cloudflare Workers
   * app.get('*', async c => {
   *   const counter = c.env.COUNTER
   * })
   * ```
   */
  env = {};
  #var;
  finalized = false;
  /**
   * `.error` can get the error object from the middleware if the Handler throws an error.
   *
   * @see {@link https://hono.dev/docs/api/context#error}
   *
   * @example
   * ```ts
   * app.use('*', async (c, next) => {
   *   await next()
   *   if (c.error) {
   *     // do something...
   *   }
   * })
   * ```
   */
  error;
  #status;
  #executionCtx;
  #res;
  #layout;
  #renderer;
  #notFoundHandler;
  #preparedHeaders;
  #matchResult;
  #path;
  /**
   * Creates an instance of the Context class.
   *
   * @param req - The Request object.
   * @param options - Optional configuration options for the context.
   */
  constructor(req, options) {
    this.#rawRequest = req;
    if (options) {
      this.#executionCtx = options.executionCtx;
      this.env = options.env;
      this.#notFoundHandler = options.notFoundHandler;
      this.#path = options.path;
      this.#matchResult = options.matchResult;
    }
  }
  /**
   * `.req` is the instance of {@link HonoRequest}.
   */
  get req() {
    this.#req ??= new HonoRequest(this.#rawRequest, this.#path, this.#matchResult);
    return this.#req;
  }
  /**
   * @see {@link https://hono.dev/docs/api/context#event}
   * The FetchEvent associated with the current request.
   *
   * @throws Will throw an error if the context does not have a FetchEvent.
   */
  get event() {
    if (this.#executionCtx && "respondWith" in this.#executionCtx) {
      return this.#executionCtx;
    } else {
      throw Error("This context has no FetchEvent");
    }
  }
  /**
   * @see {@link https://hono.dev/docs/api/context#executionctx}
   * The ExecutionContext associated with the current request.
   *
   * @throws Will throw an error if the context does not have an ExecutionContext.
   */
  get executionCtx() {
    if (this.#executionCtx) {
      return this.#executionCtx;
    } else {
      throw Error("This context has no ExecutionContext");
    }
  }
  /**
   * @see {@link https://hono.dev/docs/api/context#res}
   * The Response object for the current request.
   */
  get res() {
    return this.#res ||= createResponseInstance(null, {
      headers: this.#preparedHeaders ??= new Headers()
    });
  }
  /**
   * Sets the Response object for the current request.
   *
   * @param _res - The Response object to set.
   */
  set res(_res) {
    if (this.#res && _res) {
      _res = createResponseInstance(_res.body, _res);
      for (const [k, v] of this.#res.headers.entries()) {
        if (k === "content-type") {
          continue;
        }
        if (k === "set-cookie") {
          const cookies = this.#res.headers.getSetCookie();
          _res.headers.delete("set-cookie");
          for (const cookie of cookies) {
            _res.headers.append("set-cookie", cookie);
          }
        } else {
          _res.headers.set(k, v);
        }
      }
    }
    this.#res = _res;
    this.finalized = true;
  }
  /**
   * `.render()` can create a response within a layout.
   *
   * @see {@link https://hono.dev/docs/api/context#render-setrenderer}
   *
   * @example
   * ```ts
   * app.get('/', (c) => {
   *   return c.render('Hello!')
   * })
   * ```
   */
  render = /* @__PURE__ */ __name((...args2) => {
    this.#renderer ??= (content) => this.html(content);
    return this.#renderer(...args2);
  }, "render");
  /**
   * Sets the layout for the response.
   *
   * @param layout - The layout to set.
   * @returns The layout function.
   */
  setLayout = /* @__PURE__ */ __name((layout) => this.#layout = layout, "setLayout");
  /**
   * Gets the current layout for the response.
   *
   * @returns The current layout function.
   */
  getLayout = /* @__PURE__ */ __name(() => this.#layout, "getLayout");
  /**
   * `.setRenderer()` can set the layout in the custom middleware.
   *
   * @see {@link https://hono.dev/docs/api/context#render-setrenderer}
   *
   * @example
   * ```tsx
   * app.use('*', async (c, next) => {
   *   c.setRenderer((content) => {
   *     return c.html(
   *       <html>
   *         <body>
   *           <p>{content}</p>
   *         </body>
   *       </html>
   *     )
   *   })
   *   await next()
   * })
   * ```
   */
  setRenderer = /* @__PURE__ */ __name((renderer) => {
    this.#renderer = renderer;
  }, "setRenderer");
  /**
   * `.header()` can set headers.
   *
   * @see {@link https://hono.dev/docs/api/context#header}
   *
   * @example
   * ```ts
   * app.get('/welcome', (c) => {
   *   // Set headers
   *   c.header('X-Message', 'Hello!')
   *   c.header('Content-Type', 'text/plain')
   *
   *   return c.body('Thank you for coming')
   * })
   * ```
   */
  header = /* @__PURE__ */ __name((name, value, options) => {
    if (this.finalized) {
      this.#res = createResponseInstance(this.#res.body, this.#res);
    }
    const headers = this.#res ? this.#res.headers : this.#preparedHeaders ??= new Headers();
    if (value === void 0) {
      headers.delete(name);
    } else if (options?.append) {
      headers.append(name, value);
    } else {
      headers.set(name, value);
    }
  }, "header");
  status = /* @__PURE__ */ __name((status) => {
    this.#status = status;
  }, "status");
  /**
   * `.set()` can set the value specified by the key.
   *
   * @see {@link https://hono.dev/docs/api/context#set-get}
   *
   * @example
   * ```ts
   * app.use('*', async (c, next) => {
   *   c.set('message', 'Hono is hot!!')
   *   await next()
   * })
   * ```
   */
  set = /* @__PURE__ */ __name((key, value) => {
    this.#var ??= /* @__PURE__ */ new Map();
    this.#var.set(key, value);
  }, "set");
  /**
   * `.get()` can use the value specified by the key.
   *
   * @see {@link https://hono.dev/docs/api/context#set-get}
   *
   * @example
   * ```ts
   * app.get('/', (c) => {
   *   const message = c.get('message')
   *   return c.text(`The message is "${message}"`)
   * })
   * ```
   */
  get = /* @__PURE__ */ __name((key) => {
    return this.#var ? this.#var.get(key) : void 0;
  }, "get");
  /**
   * `.var` can access the value of a variable.
   *
   * @see {@link https://hono.dev/docs/api/context#var}
   *
   * @example
   * ```ts
   * const result = c.var.client.oneMethod()
   * ```
   */
  // c.var.propName is a read-only
  get var() {
    if (!this.#var) {
      return {};
    }
    return Object.fromEntries(this.#var);
  }
  #newResponse(data, arg, headers) {
    let responseHeaders = this.#res ? new Headers(this.#res.headers) : this.#preparedHeaders;
    if (typeof arg === "object" && arg.headers) {
      responseHeaders ??= new Headers();
      for (const [key, value] of new Headers(arg.headers)) {
        if (key === "set-cookie") {
          responseHeaders.append(key, value);
        } else {
          responseHeaders.set(key, value);
        }
      }
    }
    if (headers) {
      if (!responseHeaders) {
        let count3 = 0;
        for (const k in headers) {
          if (++count3 > 1 || typeof headers[k] !== "string") {
            responseHeaders = new Headers();
            break;
          }
        }
      }
      if (responseHeaders) {
        for (const k in headers) {
          const v = headers[k];
          if (typeof v === "string") {
            responseHeaders.set(k, v);
          } else {
            responseHeaders.delete(k);
            for (const v2 of v) {
              responseHeaders.append(k, v2);
            }
          }
        }
      }
    }
    const status = typeof arg === "number" ? arg : arg?.status ?? this.#status;
    return createResponseInstance(data, {
      status,
      headers: responseHeaders ?? headers
    });
  }
  newResponse = /* @__PURE__ */ __name((...args2) => this.#newResponse(...args2), "newResponse");
  /**
   * `.body()` can return the HTTP response.
   * You can set headers with `.header()` and set HTTP status code with `.status`.
   * This can also be set in `.text()`, `.json()` and so on.
   *
   * @see {@link https://hono.dev/docs/api/context#body}
   *
   * @example
   * ```ts
   * app.get('/welcome', (c) => {
   *   // Set headers
   *   c.header('X-Message', 'Hello!')
   *   c.header('Content-Type', 'text/plain')
   *   // Set HTTP status code
   *   c.status(201)
   *
   *   // Return the response body
   *   return c.body('Thank you for coming')
   * })
   * ```
   */
  body = /* @__PURE__ */ __name((data, arg, headers) => this.#newResponse(data, arg, headers), "body");
  /**
   * `.text()` can render text as `Content-Type:text/plain`.
   *
   * @see {@link https://hono.dev/docs/api/context#text}
   *
   * @example
   * ```ts
   * app.get('/say', (c) => {
   *   return c.text('Hello!')
   * })
   * ```
   */
  text = /* @__PURE__ */ __name((text, arg, headers) => {
    return !this.#preparedHeaders && !this.#status && !arg && !headers && !this.finalized ? new Response(text) : this.#newResponse(
      text,
      arg,
      setDefaultContentType(TEXT_PLAIN, headers)
    );
  }, "text");
  /**
   * `.json()` can render JSON as `Content-Type:application/json`.
   *
   * @see {@link https://hono.dev/docs/api/context#json}
   *
   * @example
   * ```ts
   * app.get('/api', (c) => {
   *   return c.json({ message: 'Hello!' })
   * })
   * ```
   */
  json = /* @__PURE__ */ __name((object, arg, headers) => {
    return this.#newResponse(
      JSON.stringify(object),
      arg,
      setDefaultContentType("application/json", headers)
    );
  }, "json");
  html = /* @__PURE__ */ __name((html, arg, headers) => {
    const res = /* @__PURE__ */ __name((html2) => this.#newResponse(html2, arg, setDefaultContentType("text/html; charset=UTF-8", headers)), "res");
    return typeof html === "object" ? resolveCallback(html, HtmlEscapedCallbackPhase.Stringify, false, {}).then(res) : res(html);
  }, "html");
  /**
   * `.redirect()` can Redirect, default status code is 302.
   *
   * @see {@link https://hono.dev/docs/api/context#redirect}
   *
   * @example
   * ```ts
   * app.get('/redirect', (c) => {
   *   return c.redirect('/')
   * })
   * app.get('/redirect-permanently', (c) => {
   *   return c.redirect('/', 301)
   * })
   * ```
   */
  redirect = /* @__PURE__ */ __name((location, status) => {
    const locationString = String(location);
    this.header(
      "Location",
      // Multibyes should be encoded
      // eslint-disable-next-line no-control-regex
      !/[^\x00-\xFF]/.test(locationString) ? locationString : encodeURI(locationString)
    );
    return this.newResponse(null, status ?? 302);
  }, "redirect");
  /**
   * `.notFound()` can return the Not Found Response.
   *
   * @see {@link https://hono.dev/docs/api/context#notfound}
   *
   * @example
   * ```ts
   * app.get('/notfound', (c) => {
   *   return c.notFound()
   * })
   * ```
   */
  notFound = /* @__PURE__ */ __name(() => {
    this.#notFoundHandler ??= () => createResponseInstance();
    return this.#notFoundHandler(this);
  }, "notFound");
};

// node_modules/hono/dist/router.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var METHOD_NAME_ALL = "ALL";
var METHOD_NAME_ALL_LOWERCASE = "all";
var METHODS = ["get", "post", "put", "delete", "options", "patch", "query"];
var MESSAGE_MATCHER_IS_ALREADY_BUILT = "Can not add a route since the matcher is already built.";
var UnsupportedPathError = class extends Error {
  static {
    __name(this, "UnsupportedPathError");
  }
};

// node_modules/hono/dist/utils/constants.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var COMPOSED_HANDLER = "__COMPOSED_HANDLER";

// node_modules/hono/dist/hono-base.js
var notFoundHandler = /* @__PURE__ */ __name((c) => {
  return c.text("404 Not Found", 404);
}, "notFoundHandler");
var errorHandler = /* @__PURE__ */ __name((err2, c) => {
  if ("getResponse" in err2) {
    const res = err2.getResponse();
    return c.newResponse(res.body, res);
  }
  console.error(err2);
  return c.text("Internal Server Error", 500);
}, "errorHandler");
var Hono = class _Hono {
  static {
    __name(this, "_Hono");
  }
  get;
  post;
  put;
  delete;
  options;
  patch;
  query;
  all;
  on;
  use;
  /*
    This class is like an abstract class and does not have a router.
    To use it, inherit the class and implement router in the constructor.
  */
  router;
  getPath;
  // Cannot use `#` because it requires visibility at JavaScript runtime.
  _basePath = "/";
  #path = "/";
  routes = [];
  constructor(options = {}) {
    const allMethods = [...METHODS, METHOD_NAME_ALL_LOWERCASE];
    allMethods.forEach((method) => {
      this[method] = (args1, ...args2) => {
        if (typeof args1 === "string") {
          this.#path = args1;
        } else {
          this.#addRoute(method, this.#path, args1);
        }
        args2.forEach((handler) => {
          this.#addRoute(method, this.#path, handler);
        });
        return this;
      };
    });
    this.on = (method, path, ...handlers) => {
      for (const p of [path].flat()) {
        this.#path = p;
        for (const m of [method].flat()) {
          handlers.map((handler) => {
            this.#addRoute(m.toUpperCase(), this.#path, handler);
          });
        }
      }
      return this;
    };
    this.use = (arg1, ...handlers) => {
      if (typeof arg1 === "string") {
        this.#path = arg1;
      } else {
        this.#path = "*";
        handlers.unshift(arg1);
      }
      handlers.forEach((handler) => {
        this.#addRoute(METHOD_NAME_ALL, this.#path, handler);
      });
      return this;
    };
    const { strict, ...optionsWithoutStrict } = options;
    Object.assign(this, optionsWithoutStrict);
    this.getPath = strict ?? true ? options.getPath ?? getPath : getPathNoStrict;
  }
  #clone() {
    const clone = new _Hono({
      router: this.router,
      getPath: this.getPath
    });
    clone.errorHandler = this.errorHandler;
    clone.#notFoundHandler = this.#notFoundHandler;
    clone.routes = this.routes;
    return clone;
  }
  #notFoundHandler = notFoundHandler;
  // Cannot use `#` because it requires visibility at JavaScript runtime.
  errorHandler = errorHandler;
  /**
   * `.route()` allows grouping other Hono instance in routes.
   *
   * @see {@link https://hono.dev/docs/api/routing#grouping}
   *
   * @param {string} path - base Path
   * @param {Hono} app - other Hono instance
   * @returns {Hono} routed Hono instance
   *
   * @example
   * ```ts
   * const app = new Hono()
   * const app2 = new Hono()
   *
   * app2.get("/user", (c) => c.text("user"))
   * app.route("/api", app2) // GET /api/user
   * ```
   */
  route(path, app2) {
    const subApp = this.basePath(path);
    app2.routes.map((r) => {
      let handler;
      if (app2.errorHandler === errorHandler) {
        handler = r.handler;
      } else {
        handler = /* @__PURE__ */ __name(async (c, next) => (await compose([], app2.errorHandler)(c, () => r.handler(c, next))).res, "handler");
        handler[COMPOSED_HANDLER] = r.handler;
      }
      subApp.#addRoute(r.method, r.path, handler, r.basePath);
    });
    return this;
  }
  /**
   * `.basePath()` allows base paths to be specified.
   *
   * @see {@link https://hono.dev/docs/api/routing#base-path}
   *
   * @param {string} path - base Path
   * @returns {Hono} changed Hono instance
   *
   * @example
   * ```ts
   * const api = new Hono().basePath('/api')
   * ```
   */
  basePath(path) {
    const subApp = this.#clone();
    subApp._basePath = mergePath(this._basePath, path);
    return subApp;
  }
  /**
   * `.onError()` handles an error and returns a customized Response.
   *
   * @see {@link https://hono.dev/docs/api/hono#error-handling}
   *
   * @param {ErrorHandler} handler - request Handler for error
   * @returns {Hono} changed Hono instance
   *
   * @example
   * ```ts
   * app.onError((err, c) => {
   *   console.error(`${err}`)
   *   return c.text('Custom Error Message', 500)
   * })
   * ```
   */
  onError = /* @__PURE__ */ __name((handler) => {
    this.errorHandler = handler;
    return this;
  }, "onError");
  /**
   * `.notFound()` allows you to customize a Not Found Response.
   *
   * @see {@link https://hono.dev/docs/api/hono#not-found}
   *
   * @param {NotFoundHandler} handler - request handler for not-found
   * @returns {Hono} changed Hono instance
   *
   * @example
   * ```ts
   * app.notFound((c) => {
   *   return c.text('Custom 404 Message', 404)
   * })
   * ```
   */
  notFound = /* @__PURE__ */ __name((handler) => {
    this.#notFoundHandler = handler;
    return this;
  }, "notFound");
  /**
   * `.mount()` allows you to mount applications built with other frameworks into your Hono application.
   *
   * @see {@link https://hono.dev/docs/api/hono#mount}
   *
   * @param {string} path - base Path
   * @param {Function} applicationHandler - other Request Handler
   * @param {MountOptions} [options] - options of `.mount()`
   * @returns {Hono} mounted Hono instance
   *
   * @example
   * ```ts
   * import { Router as IttyRouter } from 'itty-router'
   * import { Hono } from 'hono'
   * // Create itty-router application
   * const ittyRouter = IttyRouter()
   * // GET /itty-router/hello
   * ittyRouter.get('/hello', () => new Response('Hello from itty-router'))
   *
   * const app = new Hono()
   * app.mount('/itty-router', ittyRouter.handle)
   * ```
   *
   * @example
   * ```ts
   * const app = new Hono()
   * // Send the request to another application without modification.
   * app.mount('/app', anotherApp, {
   *   replaceRequest: (req) => req,
   * })
   * ```
   */
  mount(path, applicationHandler, options) {
    let replaceRequest;
    let optionHandler;
    if (options) {
      if (typeof options === "function") {
        optionHandler = options;
      } else {
        optionHandler = options.optionHandler;
        if (options.replaceRequest === false) {
          replaceRequest = /* @__PURE__ */ __name((request) => request, "replaceRequest");
        } else {
          replaceRequest = options.replaceRequest;
        }
      }
    }
    const getOptions = optionHandler ? (c) => {
      const options2 = optionHandler(c);
      return Array.isArray(options2) ? options2 : [options2];
    } : (c) => {
      let executionContext = void 0;
      try {
        executionContext = c.executionCtx;
      } catch {
      }
      return [c.env, executionContext];
    };
    replaceRequest ||= (() => {
      const mergedPath = mergePath(this._basePath, path);
      const pathPrefixLength = mergedPath === "/" ? 0 : mergedPath.length;
      return (request) => {
        const url = new URL(request.url);
        url.pathname = this.getPath(request).slice(pathPrefixLength) || "/";
        return new Request(url, request);
      };
    })();
    const handler = /* @__PURE__ */ __name(async (c, next) => {
      const res = await applicationHandler(replaceRequest(c.req.raw), ...getOptions(c));
      if (res) {
        return res;
      }
      await next();
    }, "handler");
    this.#addRoute(METHOD_NAME_ALL, mergePath(path, "*"), handler);
    return this;
  }
  #addRoute(method, path, handler, baseRoutePath) {
    method = method.toUpperCase();
    path = mergePath(this._basePath, path);
    const r = {
      basePath: baseRoutePath !== void 0 ? mergePath(this._basePath, baseRoutePath) : this._basePath,
      path,
      method,
      handler
    };
    this.router.add(method, path, [handler, r]);
    this.routes.push(r);
  }
  #handleError(err2, c) {
    if (err2 instanceof Error) {
      return this.errorHandler(err2, c);
    }
    throw err2;
  }
  #dispatch(request, executionCtx, env2, method) {
    if (method === "HEAD") {
      return (async () => new Response(null, await this.#dispatch(request, executionCtx, env2, "GET")))();
    }
    const path = this.getPath(request, { env: env2 });
    const matchResult = this.router.match(method, path);
    const c = new Context(request, {
      path,
      matchResult,
      env: env2,
      executionCtx,
      notFoundHandler: this.#notFoundHandler
    });
    if (matchResult[0].length === 1) {
      let res;
      try {
        res = matchResult[0][0][0][0](c, async () => {
          c.res = await this.#notFoundHandler(c);
        });
      } catch (err2) {
        return this.#handleError(err2, c);
      }
      return res instanceof Promise ? res.then(
        (resolved) => resolved || (c.finalized ? c.res : this.#notFoundHandler(c))
      ).catch((err2) => this.#handleError(err2, c)) : res ?? this.#notFoundHandler(c);
    }
    const composed = compose(matchResult[0], this.errorHandler, this.#notFoundHandler);
    return (async () => {
      try {
        const context2 = await composed(c);
        if (!context2.finalized) {
          throw new Error(
            "Context is not finalized. Did you forget to return a Response object or `await next()`?"
          );
        }
        return context2.res;
      } catch (err2) {
        return this.#handleError(err2, c);
      }
    })();
  }
  /**
   * `.fetch()` will be entry point of your app.
   *
   * @see {@link https://hono.dev/docs/api/hono#fetch}
   *
   * @param {Request} request - request Object of request
   * @param {Env} env - env Object
   * @param {ExecutionContext} executionCtx - context of execution
   * @returns {Response | Promise<Response>} response of request
   *
   */
  fetch = /* @__PURE__ */ __name((request, ...rest) => {
    return this.#dispatch(request, rest[1], rest[0], request.method);
  }, "fetch");
  /**
   * `.request()` is a useful method for testing.
   * You can pass a URL or pathname to send a GET request.
   * app will return a Response object.
   * ```ts
   * test('GET /hello is ok', async () => {
   *   const res = await app.request('/hello')
   *   expect(res.status).toBe(200)
   * })
   * ```
   * @see https://hono.dev/docs/api/hono#request
   */
  request = /* @__PURE__ */ __name((input, requestInit, Env, executionCtx) => {
    if (input instanceof Request) {
      return this.fetch(requestInit ? new Request(input, requestInit) : input, Env, executionCtx);
    }
    input = input.toString();
    return this.fetch(
      new Request(
        /^https?:\/\//.test(input) ? input : `http://localhost${mergePath("/", input)}`,
        requestInit
      ),
      Env,
      executionCtx
    );
  }, "request");
  /**
   * `.fire()` automatically adds a global fetch event listener.
   * This can be useful for environments that adhere to the Service Worker API, such as non-ES module Cloudflare Workers.
   * @deprecated
   * Use `fire` from `hono/service-worker` instead.
   * ```ts
   * import { Hono } from 'hono'
   * import { fire } from 'hono/service-worker'
   *
   * const app = new Hono()
   * // ...
   * fire(app)
   * ```
   * @see https://hono.dev/docs/api/hono#fire
   * @see https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API
   * @see https://developers.cloudflare.com/workers/reference/migrate-to-module-workers/
   */
  fire = /* @__PURE__ */ __name(() => {
    addEventListener("fetch", (event) => {
      event.respondWith(this.#dispatch(event.request, event, void 0, event.request.method));
    });
  }, "fire");
};

// node_modules/hono/dist/router/reg-exp-router/index.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/reg-exp-router/router.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/reg-exp-router/matcher.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var emptyParam = [];
function match(method, path) {
  const matchers = this.buildAllMatchers();
  const match2 = /* @__PURE__ */ __name(((method2, path2) => {
    const matcher = matchers[method2] || matchers[METHOD_NAME_ALL];
    const staticMatch = matcher[2][path2];
    if (staticMatch) {
      return staticMatch;
    }
    const match3 = path2.match(matcher[0]);
    if (!match3) {
      return [[], emptyParam];
    }
    const index = match3.indexOf("", 1);
    return [matcher[1][index], match3];
  }), "match2");
  this.match = match2;
  return match2(method, path);
}
__name(match, "match");

// node_modules/hono/dist/router/reg-exp-router/node.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var LABEL_REG_EXP_STR = "[^/]+";
var ONLY_WILDCARD_REG_EXP_STR = ".*";
var TAIL_WILDCARD_REG_EXP_STR = "(?:|/.*)";
var PATH_ERROR = /* @__PURE__ */ Symbol();
var regExpMetaChars = new Set(".\\+*[^]$()");
function compareKey(a, b) {
  if (a.length === 1) {
    return b.length === 1 ? a < b ? -1 : 1 : -1;
  }
  if (b.length === 1) {
    return 1;
  }
  if (a === ONLY_WILDCARD_REG_EXP_STR || a === TAIL_WILDCARD_REG_EXP_STR) {
    return b === TAIL_WILDCARD_REG_EXP_STR ? -1 : 1;
  } else if (b === ONLY_WILDCARD_REG_EXP_STR || b === TAIL_WILDCARD_REG_EXP_STR) {
    return -1;
  }
  if (a === LABEL_REG_EXP_STR) {
    return 1;
  } else if (b === LABEL_REG_EXP_STR) {
    return -1;
  }
  return a.length === b.length ? a < b ? -1 : 1 : b.length - a.length;
}
__name(compareKey, "compareKey");
var Node = class _Node {
  static {
    __name(this, "_Node");
  }
  // handler index of a dynamic path, or -1 for a static path terminal
  #index;
  #varIndex;
  #children = /* @__PURE__ */ Object.create(null);
  insert(tokens, index, paramMap, context2, isStatic) {
    let node = this;
    for (let i = 0, len = tokens.length; i < len; i++) {
      const token = tokens[i];
      const pattern = token.length === 1 ? token === "*" ? i === len - 1 ? ["", "", ONLY_WILDCARD_REG_EXP_STR] : ["", "", LABEL_REG_EXP_STR] : null : token === "/*" ? ["", "", TAIL_WILDCARD_REG_EXP_STR] : token.match(/^\:([^\{\}]+)(?:\{(.+)\})?$/);
      let nextNode;
      if (pattern) {
        const name = pattern[1];
        let regexpStr = pattern[2] || LABEL_REG_EXP_STR;
        if (name && pattern[2]) {
          if (regexpStr === ".*") {
            throw PATH_ERROR;
          }
          regexpStr = regexpStr.replace(/^\((?!\?:)(?=[^)]+\)$)/, "(?:");
          if (/\((?!\?:)/.test(regexpStr)) {
            throw PATH_ERROR;
          }
          if (regexpStr.length === 1 && regExpMetaChars.has(regexpStr)) {
            throw PATH_ERROR;
          }
        }
        nextNode = node.#children[regexpStr];
        if (!nextNode) {
          if (regexpStr !== ONLY_WILDCARD_REG_EXP_STR && regexpStr !== TAIL_WILDCARD_REG_EXP_STR) {
            for (const k in node.#children) {
              if (
                // a single-char pattern coexists with single-char literals as a literal does
                (regexpStr.length > 1 || k.length > 1) && k !== ONLY_WILDCARD_REG_EXP_STR && k !== TAIL_WILDCARD_REG_EXP_STR
              ) {
                throw PATH_ERROR;
              }
            }
          }
          nextNode = node.#children[regexpStr] = new _Node();
        }
        if (name !== "") {
          nextNode.#varIndex ??= context2.varIndex++;
          paramMap.push([name, nextNode.#varIndex]);
        }
      } else {
        nextNode = node.#children[token];
        if (!nextNode) {
          for (const k in node.#children) {
            if (k.length > 1 && k !== ONLY_WILDCARD_REG_EXP_STR && k !== TAIL_WILDCARD_REG_EXP_STR) {
              throw PATH_ERROR;
            }
          }
          nextNode = node.#children[token] = new _Node();
        }
      }
      node = nextNode;
    }
    if (node.#index !== void 0) {
      throw PATH_ERROR;
    }
    node.#index = isStatic ? -1 : index;
  }
  buildRegExpStr() {
    const childKeys = Object.keys(this.#children).sort(compareKey);
    const strList = childKeys.map((k) => {
      const c = this.#children[k];
      const childStr = c.buildRegExpStr();
      return childStr === "" ? "" : (typeof c.#varIndex === "number" ? `(${k})@${c.#varIndex}` : regExpMetaChars.has(k) ? `\\${k}` : k) + childStr;
    }).filter(Boolean);
    if (typeof this.#index === "number" && this.#index !== -1) {
      strList.unshift(`#${this.#index}`);
    }
    if (strList.length === 0) {
      return "";
    }
    if (strList.length === 1) {
      return strList[0];
    }
    return "(?:" + strList.join("|") + ")";
  }
};

// node_modules/hono/dist/router/reg-exp-router/trie.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var Trie = class {
  static {
    __name(this, "Trie");
  }
  #context = { varIndex: 0 };
  #root = new Node();
  #index = 0;
  // dynamic path -> [handler index, param assoc]; static paths are not registered
  paths = /* @__PURE__ */ Object.create(null);
  insert(path, isStatic) {
    if (isStatic) {
      this.#root.insert(path.split(""), 0, [], this.#context, true);
      return;
    }
    const paramAssoc = [];
    const groups = [];
    let markedPath = path;
    for (let i = 0; ; ) {
      let replaced = false;
      markedPath = markedPath.replace(/\{[^}]+\}/g, (m) => {
        const mark = `@\\${i}`;
        groups[i] = [mark, m];
        i++;
        replaced = true;
        return mark;
      });
      if (!replaced) {
        break;
      }
    }
    const tokens = markedPath.match(/(?::[^\/]+)|(?:\/\*$)|./g) || [];
    for (let i = groups.length - 1; i >= 0; i--) {
      const [mark] = groups[i];
      for (let j = tokens.length - 1; j >= 0; j--) {
        if (tokens[j].indexOf(mark) !== -1) {
          tokens[j] = tokens[j].replace(mark, groups[i][1]);
          break;
        }
      }
    }
    this.#root.insert(tokens, this.#index, paramAssoc, this.#context, false);
    this.paths[path] = [this.#index++, paramAssoc];
  }
  buildRegExp() {
    let regexp = this.#root.buildRegExpStr();
    if (regexp === "") {
      return [/^$/, [], []];
    }
    let captureIndex = 0;
    const indexReplacementMap = [];
    const paramReplacementMap = [];
    regexp = regexp.replace(/#(\d+)|@(\d+)|\.\*\$/g, (_, handlerIndex, paramIndex) => {
      if (handlerIndex !== void 0) {
        indexReplacementMap[++captureIndex] = Number(handlerIndex);
        return "$()";
      }
      if (paramIndex !== void 0) {
        paramReplacementMap[Number(paramIndex)] = ++captureIndex;
        return "";
      }
      return "";
    });
    return [new RegExp(`^${regexp}`), indexReplacementMap, paramReplacementMap];
  }
};

// node_modules/hono/dist/router/reg-exp-router/router.js
var wildcardRegExpCache = /* @__PURE__ */ Object.create(null);
function buildWildcardRegExp(path) {
  return wildcardRegExpCache[path] ??= new RegExp(
    path === "*" ? "" : `^${path.replace(
      /\/\*$|([.\\+*[^\]$()])/g,
      (_, metaChar) => metaChar ? `\\${metaChar}` : "(?:|/.*)"
    )}$`
  );
}
__name(buildWildcardRegExp, "buildWildcardRegExp");
function clearWildcardRegExpCache() {
  wildcardRegExpCache = /* @__PURE__ */ Object.create(null);
}
__name(clearWildcardRegExpCache, "clearWildcardRegExpCache");
function findMiddleware(middleware, path) {
  if (!middleware) {
    return void 0;
  }
  for (const k of Object.keys(middleware).sort((a, b) => b.length - a.length)) {
    if (buildWildcardRegExp(k).test(path)) {
      return [...middleware[k]];
    }
  }
  return void 0;
}
__name(findMiddleware, "findMiddleware");
var RegExpRouter = class {
  static {
    __name(this, "RegExpRouter");
  }
  name = "RegExpRouter";
  #middleware;
  #routes;
  #tries;
  constructor() {
    this.#middleware = { [METHOD_NAME_ALL]: /* @__PURE__ */ Object.create(null) };
    this.#routes = { [METHOD_NAME_ALL]: /* @__PURE__ */ Object.create(null) };
    this.#tries = { [METHOD_NAME_ALL]: new Trie() };
  }
  #insertPath(method, path) {
    try {
      this.#tries[method].insert(path, !/\*|\/:/.test(path));
    } catch (e) {
      throw e === PATH_ERROR ? new UnsupportedPathError(path) : e;
    }
  }
  add(method, path, handler) {
    const middleware = this.#middleware;
    const routes = this.#routes;
    if (!middleware || !routes) {
      throw new Error(MESSAGE_MATCHER_IS_ALREADY_BUILT);
    }
    if (!middleware[method]) {
      this.#tries[method] = new Trie();
      [middleware, routes].forEach((handlerMap) => {
        handlerMap[method] = /* @__PURE__ */ Object.create(null);
        Object.keys(handlerMap[METHOD_NAME_ALL]).forEach((p) => {
          handlerMap[method][p] = [...handlerMap[METHOD_NAME_ALL][p]];
          this.#insertPath(method, p);
        });
      });
    }
    if (path === "/*") {
      path = "*";
    }
    const paramCount = (path.match(/\/:/g) || []).length;
    if (/\*$/.test(path)) {
      const re = buildWildcardRegExp(path);
      Object.keys(middleware).forEach((m) => {
        if ((method === METHOD_NAME_ALL || method === m) && !middleware[m][path]) {
          this.#insertPath(m, path);
          middleware[m][path] = findMiddleware(middleware[m], path) || findMiddleware(middleware[METHOD_NAME_ALL], path) || [];
        }
      });
      Object.keys(middleware).forEach((m) => {
        if (method === METHOD_NAME_ALL || method === m) {
          Object.keys(middleware[m]).forEach((p) => {
            re.test(p) && middleware[m][p].push([handler, paramCount]);
          });
        }
      });
      Object.keys(routes).forEach((m) => {
        if (method === METHOD_NAME_ALL || method === m) {
          Object.keys(routes[m]).forEach(
            (p) => re.test(p) && routes[m][p].push([handler, paramCount])
          );
        }
      });
      return;
    }
    const paths = checkOptionalParameter(path) || [path];
    for (let i = 0, len = paths.length; i < len; i++) {
      const path2 = paths[i];
      Object.keys(routes).forEach((m) => {
        if (method === METHOD_NAME_ALL || method === m) {
          if (!routes[m][path2]) {
            this.#insertPath(m, path2);
            routes[m][path2] = [
              ...findMiddleware(middleware[m], path2) || findMiddleware(middleware[METHOD_NAME_ALL], path2) || []
            ];
          }
          routes[m][path2].push([handler, paramCount - len + i + 1]);
        }
      });
    }
  }
  match = match;
  buildAllMatchers() {
    const matchers = /* @__PURE__ */ Object.create(null);
    Object.keys(this.#routes).concat(Object.keys(this.#middleware)).forEach((method) => {
      matchers[method] ||= this.#buildMatcher(method);
    });
    this.#middleware = this.#routes = this.#tries = void 0;
    clearWildcardRegExpCache();
    return matchers;
  }
  #buildMatcher(method) {
    const middleware = this.#middleware[method];
    const routes = this.#routes[method];
    const trie = this.#tries[method];
    const staticMap = /* @__PURE__ */ Object.create(null);
    const handlerData = [];
    [middleware, routes].forEach((r) => {
      for (const path in r) {
        const handlers = r[path];
        const pathData = trie.paths[path];
        if (!pathData) {
          staticMap[path] = [handlers.map(([h]) => [h, /* @__PURE__ */ Object.create(null)]), emptyParam];
          continue;
        }
        const paramAssoc = pathData[1];
        handlerData[pathData[0]] = handlers.map(([h, paramCount]) => {
          const paramIndexMap = /* @__PURE__ */ Object.create(null);
          paramCount -= 1;
          for (; paramCount >= 0; paramCount--) {
            const [key, value] = paramAssoc[paramCount];
            paramIndexMap[key] = value;
          }
          return [h, paramIndexMap];
        });
      }
    });
    const [regexp, indexReplacementMap, paramReplacementMap] = trie.buildRegExp();
    for (let i = 0, len = handlerData.length; i < len; i++) {
      for (let j = 0, len2 = handlerData[i].length; j < len2; j++) {
        const map = handlerData[i][j]?.[1];
        if (!map) {
          continue;
        }
        const keys = Object.keys(map);
        for (let k = 0, len3 = keys.length; k < len3; k++) {
          map[keys[k]] = paramReplacementMap[map[keys[k]]];
        }
      }
    }
    const handlerMap = [];
    for (const i in indexReplacementMap) {
      handlerMap[i] = handlerData[indexReplacementMap[i]];
    }
    return [regexp, handlerMap, staticMap];
  }
};

// node_modules/hono/dist/router/reg-exp-router/prepared-router.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/smart-router/index.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/smart-router/router.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var SmartRouter = class {
  static {
    __name(this, "SmartRouter");
  }
  name = "SmartRouter";
  #routers = [];
  #routes = [];
  constructor(init) {
    this.#routers = init.routers;
  }
  add(method, path, handler) {
    if (!this.#routes) {
      throw new Error(MESSAGE_MATCHER_IS_ALREADY_BUILT);
    }
    this.#routes.push([method, path, handler]);
  }
  match(method, path) {
    if (!this.#routes) {
      throw new Error("Fatal error");
    }
    const routers = this.#routers;
    const routes = this.#routes;
    const len = routers.length;
    let i = 0;
    let res;
    for (; i < len; i++) {
      const router = routers[i];
      try {
        for (let i2 = 0, len2 = routes.length; i2 < len2; i2++) {
          router.add(...routes[i2]);
        }
        res = router.match(method, path);
      } catch (e) {
        if (e instanceof UnsupportedPathError) {
          continue;
        }
        throw e;
      }
      this.match = router.match.bind(router);
      this.#routers = [router];
      this.#routes = void 0;
      break;
    }
    if (i === len) {
      throw new Error("Fatal error");
    }
    this.name = `SmartRouter + ${this.activeRouter.name}`;
    return res;
  }
  get activeRouter() {
    if (this.#routes || this.#routers.length !== 1) {
      throw new Error("No active router has been determined yet.");
    }
    return this.#routers[0];
  }
};

// node_modules/hono/dist/router/trie-router/index.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/trie-router/router.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// node_modules/hono/dist/router/trie-router/node.js
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var emptyParams = /* @__PURE__ */ Object.create(null);
var hasChildren = /* @__PURE__ */ __name((children) => {
  for (const _ in children) {
    return true;
  }
  return false;
}, "hasChildren");
var Node2 = class _Node2 {
  static {
    __name(this, "_Node");
  }
  #methods;
  #children;
  #patterns;
  #order = 0;
  #params = emptyParams;
  constructor(method, handler, children) {
    this.#children = children || /* @__PURE__ */ Object.create(null);
    this.#methods = [];
    if (method && handler) {
      const m = /* @__PURE__ */ Object.create(null);
      m[method] = { handler, possibleKeys: [], score: 0 };
      this.#methods = [m];
    }
    this.#patterns = [];
  }
  insert(method, path, handler) {
    this.#order = ++this.#order;
    let curNode = this;
    const parts = splitRoutingPath(path);
    const possibleKeys = [];
    for (let i = 0, len = parts.length; i < len; i++) {
      const p = parts[i];
      const nextP = parts[i + 1];
      const pattern = getPattern(p, nextP);
      const key = Array.isArray(pattern) ? pattern[0] : p;
      if (key in curNode.#children) {
        curNode = curNode.#children[key];
        if (pattern) {
          possibleKeys.push(pattern[1]);
        }
        continue;
      }
      curNode.#children[key] = new _Node2();
      if (pattern) {
        curNode.#patterns.push(pattern);
        possibleKeys.push(pattern[1]);
      }
      curNode = curNode.#children[key];
    }
    curNode.#methods.push({
      [method]: {
        handler,
        possibleKeys: possibleKeys.filter((v, i, a) => a.indexOf(v) === i),
        score: this.#order
      }
    });
    return curNode;
  }
  #pushHandlerSets(handlerSets, node, method, nodeParams, params) {
    for (let i = 0, len = node.#methods.length; i < len; i++) {
      const m = node.#methods[i];
      const handlerSet = m[method] || m[METHOD_NAME_ALL];
      const processedSet = {};
      if (handlerSet !== void 0) {
        handlerSet.params = /* @__PURE__ */ Object.create(null);
        handlerSets.push(handlerSet);
        if (nodeParams !== emptyParams || params && params !== emptyParams) {
          for (let i2 = 0, len2 = handlerSet.possibleKeys.length; i2 < len2; i2++) {
            const key = handlerSet.possibleKeys[i2];
            const processed = processedSet[handlerSet.score];
            handlerSet.params[key] = params?.[key] && !processed ? params[key] : nodeParams[key] ?? params?.[key];
            processedSet[handlerSet.score] = true;
          }
        }
      }
    }
  }
  search(method, path) {
    const handlerSets = [];
    this.#params = emptyParams;
    const curNode = this;
    let curNodes = [curNode];
    const parts = splitPath(path);
    const curNodesQueue = [];
    const len = parts.length;
    let partOffsets = null;
    for (let i = 0; i < len; i++) {
      const part = parts[i];
      const isLast = i === len - 1;
      const tempNodes = [];
      for (let j = 0, len2 = curNodes.length; j < len2; j++) {
        const node = curNodes[j];
        const nextNode = node.#children[part];
        if (nextNode) {
          nextNode.#params = node.#params;
          if (isLast) {
            if (nextNode.#children["*"]) {
              this.#pushHandlerSets(handlerSets, nextNode.#children["*"], method, node.#params);
            }
            this.#pushHandlerSets(handlerSets, nextNode, method, node.#params);
          } else {
            tempNodes.push(nextNode);
          }
        }
        for (let k = 0, len3 = node.#patterns.length; k < len3; k++) {
          const pattern = node.#patterns[k];
          const params = node.#params === emptyParams ? {} : { ...node.#params };
          if (pattern === "*") {
            const astNode = node.#children["*"];
            if (astNode) {
              this.#pushHandlerSets(handlerSets, astNode, method, node.#params);
              astNode.#params = params;
              tempNodes.push(astNode);
            }
            continue;
          }
          const [key, name, matcher] = pattern;
          if (!part && !(matcher instanceof RegExp)) {
            continue;
          }
          const child = node.#children[key];
          if (matcher instanceof RegExp) {
            if (partOffsets === null) {
              partOffsets = new Array(len);
              let offset = path[0] === "/" ? 1 : 0;
              for (let p = 0; p < len; p++) {
                partOffsets[p] = offset;
                offset += parts[p].length + 1;
              }
            }
            const restPathString = path.substring(partOffsets[i]);
            const m = matcher.exec(restPathString);
            if (m) {
              params[name] = m[0];
              this.#pushHandlerSets(handlerSets, child, method, node.#params, params);
              if (m[0].length === restPathString.length && child.#children["*"]) {
                this.#pushHandlerSets(
                  handlerSets,
                  child.#children["*"],
                  method,
                  node.#params,
                  params
                );
              }
              if (hasChildren(child.#children)) {
                child.#params = params;
                const componentCount = m[0].match(/\//)?.length ?? 0;
                const targetCurNodes = curNodesQueue[componentCount] ||= [];
                targetCurNodes.push(child);
              }
              continue;
            }
          }
          if (matcher === true || matcher.test(part)) {
            params[name] = part;
            if (isLast) {
              this.#pushHandlerSets(handlerSets, child, method, params, node.#params);
              if (child.#children["*"]) {
                this.#pushHandlerSets(
                  handlerSets,
                  child.#children["*"],
                  method,
                  params,
                  node.#params
                );
              }
            } else {
              child.#params = params;
              tempNodes.push(child);
            }
          }
        }
      }
      const shifted = curNodesQueue.shift();
      curNodes = shifted ? tempNodes.concat(shifted) : tempNodes;
    }
    if (handlerSets.length > 1) {
      handlerSets.sort((a, b) => {
        return a.score - b.score;
      });
    }
    return [handlerSets.map(({ handler, params }) => [handler, params])];
  }
};

// node_modules/hono/dist/router/trie-router/router.js
var TrieRouter = class {
  static {
    __name(this, "TrieRouter");
  }
  name = "TrieRouter";
  #node;
  constructor() {
    this.#node = new Node2();
  }
  add(method, path, handler) {
    const results = checkOptionalParameter(path);
    if (results) {
      for (let i = 0, len = results.length; i < len; i++) {
        this.#node.insert(method, results[i], handler);
      }
      return;
    }
    this.#node.insert(method, path, handler);
  }
  match(method, path) {
    return this.#node.search(method, path);
  }
};

// node_modules/hono/dist/hono.js
var Hono2 = class extends Hono {
  static {
    __name(this, "Hono");
  }
  /**
   * Creates an instance of the Hono class.
   *
   * @param options - Optional configuration options for the Hono instance.
   */
  constructor(options = {}) {
    super(options);
    this.router = options.router ?? new SmartRouter({
      routers: [new RegExpRouter(), new TrieRouter()]
    });
  }
};

// src/api/routes.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// src/lib/db.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
function num(v) {
  if (v === null || v === void 0) return 0;
  const n = Number(v);
  return Number.isNaN(n) ? 0 : n;
}
__name(num, "num");
function s(v) {
  if (v === null || v === void 0) return "";
  return String(v);
}
__name(s, "s");
function args(values) {
  return values.map((v) => {
    if (v === void 0 || v === null) return null;
    if (typeof v === "number" || typeof v === "string" || typeof v === "boolean") return v;
    return String(v);
  });
}
__name(args, "args");
async function all(db, sql, values = []) {
  const res = await db.prepare(sql).bind(...args(values)).all();
  return res.results ?? [];
}
__name(all, "all");
async function one(db, sql, values = []) {
  const rows = await all(db, sql, values);
  return rows[0] ?? null;
}
__name(one, "one");
async function run(db, sql, values = []) {
  await db.prepare(sql).bind(...args(values)).run();
}
__name(run, "run");
async function insertId(db, sql, values = []) {
  const res = await db.prepare(sql).bind(...args(values)).run();
  const meta = res.meta;
  return meta?.last_row_id ?? 0;
}
__name(insertId, "insertId");

// src/lib/passwords.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var import_bcryptjs = __toESM(require_bcrypt());
var PBKDF2_ITERATIONS = 1e5;
function b64encode(buf) {
  const bytes = buf instanceof Uint8Array ? buf : new Uint8Array(buf);
  let bin = "";
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return btoa(bin);
}
__name(b64encode, "b64encode");
function b64decode(s4) {
  const bin = atob(s4);
  const bytes = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}
__name(b64decode, "b64decode");
async function hashPassword(plain) {
  try {
    const hash = await new Promise((res, rej) => {
      import_bcryptjs.default.hash(plain, 10, (e, h) => e ? rej(e) : res(h));
    });
    if (typeof hash === "string" && hash.startsWith("$2")) return hash;
  } catch {
  }
  return hashPasswordPbkdf2(plain);
}
__name(hashPassword, "hashPassword");
async function verifyPassword(plain, stored) {
  if (!stored) return false;
  if (stored.startsWith("$2a$") || stored.startsWith("$2b$") || stored.startsWith("$2y$")) {
    try {
      return await new Promise((res, rej) => {
        import_bcryptjs.default.compare(plain, stored, (e, ok2) => e ? rej(e) : res(ok2));
      });
    } catch {
      return false;
    }
  }
  if (stored.startsWith("$pbkdf2$")) return verifyPasswordPbkdf2(plain, stored);
  return stored === plain;
}
__name(verifyPassword, "verifyPassword");
async function hashPasswordPbkdf2(plain) {
  const te = new TextEncoder();
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const bits = await crypto.subtle.deriveBits(
    { name: "PBKDF2", hash: "SHA-256", iterations: PBKDF2_ITERATIONS, salt },
    await crypto.subtle.importKey("raw", te.encode(plain), "PBKDF2", false, ["deriveBits"]),
    256
  );
  return `$pbkdf2$0$${PBKDF2_ITERATIONS}$${b64encode(salt)}$${b64encode(bits)}`;
}
__name(hashPasswordPbkdf2, "hashPasswordPbkdf2");
async function verifyPasswordPbkdf2(plain, stored) {
  try {
    const parts = stored.split("$");
    const iter = parseInt(parts[4] ?? String(PBKDF2_ITERATIONS), 10);
    const salt = b64decode(parts[5] ?? "");
    const want = parts[6] ?? "";
    const te = new TextEncoder();
    const bits = await crypto.subtle.deriveBits(
      { name: "PBKDF2", hash: "SHA-256", iterations: iter, salt },
      await crypto.subtle.importKey("raw", te.encode(plain), "PBKDF2", false, ["deriveBits"]),
      256
    );
    return b64encode(bits) === want;
  } catch {
    return false;
  }
}
__name(verifyPasswordPbkdf2, "verifyPasswordPbkdf2");

// src/lib/crypto.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
function randomToken(len = 6) {
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  const buf = crypto.getRandomValues(new Uint8Array(len));
  let out = "";
  for (let i = 0; i < len; i++) out += chars[buf[i] % chars.length];
  return out;
}
__name(randomToken, "randomToken");
function todayWIB() {
  const now = Date.now() + 7 * 3600 * 1e3;
  const d = new Date(now);
  const p = /* @__PURE__ */ __name((n) => String(n).padStart(2, "0"), "p");
  return `${d.getUTCFullYear()}-${p(d.getUTCMonth() + 1)}-${p(d.getUTCDate())}`;
}
__name(todayWIB, "todayWIB");
function nowWIB() {
  const now = Date.now() + 7 * 3600 * 1e3;
  const d = new Date(now);
  const p = /* @__PURE__ */ __name((n) => String(n).padStart(2, "0"), "p");
  return `${d.getUTCFullYear()}-${p(d.getUTCMonth() + 1)}-${p(d.getUTCDate())} ${p(d.getUTCHours())}:${p(d.getUTCMinutes())}:${p(d.getUTCSeconds())}`;
}
__name(nowWIB, "nowWIB");
function hariWIB() {
  const now = Date.now() + 7 * 3600 * 1e3;
  const days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
  return days[new Date(now).getUTCDay()];
}
__name(hariWIB, "hariWIB");
var BULAN_ID = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"];
function fmtDateID(d) {
  if (!d) return "-";
  const p = String(d).split("-");
  if (p.length !== 3) return d;
  const m = parseInt(p[1], 10);
  return `${parseInt(p[2], 10)} ${BULAN_ID[m - 1]} ${p[0]}`;
}
__name(fmtDateID, "fmtDateID");
function wibEpoch(ts) {
  return (/* @__PURE__ */ new Date(ts.replace(" ", "T") + "Z")).getTime() - 7 * 3600 * 1e3;
}
__name(wibEpoch, "wibEpoch");
function fmtWIB(ms) {
  const d = new Date(ms + 7 * 3600 * 1e3);
  const p = /* @__PURE__ */ __name((n) => String(n).padStart(2, "0"), "p");
  return `${d.getUTCFullYear()}-${p(d.getUTCMonth() + 1)}-${p(d.getUTCDate())} ${p(d.getUTCHours())}:${p(d.getUTCMinutes())}:${p(d.getUTCSeconds())}`;
}
__name(fmtWIB, "fmtWIB");

// src/lib/jwt.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var enc = new TextEncoder();
function b64url(buf) {
  let bin = "";
  for (let i = 0; i < buf.length; i++) bin += String.fromCharCode(buf[i]);
  return btoa(bin).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}
__name(b64url, "b64url");
function b64urlDecode(s4) {
  const pad = s4.replace(/-/g, "+").replace(/_/g, "/");
  const bin = atob(pad + "===".slice((pad.length + 3) % 4));
  const b = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) b[i] = bin.charCodeAt(i);
  return b;
}
__name(b64urlDecode, "b64urlDecode");
function getJwtSecret(env2) {
  if (env2.JWT_SECRET) return env2.JWT_SECRET;
  if (env2.DEBUG) return "kelaas-dev-secret";
  return "";
}
__name(getJwtSecret, "getJwtSecret");
async function signJwt(payload, secret) {
  const header = b64url(enc.encode(JSON.stringify({ alg: "HS256", typ: "JWT" })));
  const now = Math.floor(Date.now() / 1e3);
  const body = b64url(enc.encode(JSON.stringify({ ...payload, iat: now, exp: now + 7 * 24 * 3600 })));
  const data = header + "." + body;
  const key = await crypto.subtle.importKey("raw", enc.encode(secret), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  const sig = new Uint8Array(await crypto.subtle.sign("HMAC", key, enc.encode(data)));
  return data + "." + b64url(sig);
}
__name(signJwt, "signJwt");
async function verifyJwt(token, secret) {
  try {
    const [h, b, s4] = token.split(".");
    if (!h || !b || !s4) return null;
    const key = await crypto.subtle.importKey("raw", enc.encode(secret), { name: "HMAC", hash: "SHA-256" }, false, ["verify"]);
    const ok2 = await crypto.subtle.verify("HMAC", key, b64urlDecode(s4).buffer, enc.encode(h + "." + b));
    if (!ok2) return null;
    const payload = JSON.parse(new TextDecoder().decode(b64urlDecode(b)));
    if (payload.exp && payload.exp * 1e3 <= Date.now()) return null;
    return payload;
  } catch {
    return null;
  }
}
__name(verifyJwt, "verifyJwt");

// src/lib/subscription.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var GATED_ROLES = /* @__PURE__ */ new Set(["Walikelas", "Guru"]);
function planStatus(user) {
  const role = String(user.role || "");
  if (!GATED_ROLES.has(role)) return { ok: true, code: "ALLOWED" };
  if (s2(user.nip ?? user.NIP ?? "")) return { ok: true, code: "ALLOWED" };
  const plan = String(user.plan_type ?? user.planType ?? "free");
  const trialEnds = user.trial_ends_at ?? user.trialEndsAt;
  const subExpires = user.subscription_expires_at ?? user.subscriptionExpiresAt;
  const now = Date.now();
  if (plan === "premium") {
    const exp = subExpires ? wibEpoch(s2(subExpires)) : NaN;
    if (!subExpires || now > exp) return { ok: false, code: "SUBSCRIPTION_EXPIRED" };
    return { ok: true, code: "ACTIVE" };
  }
  if (plan === "trial") {
    const exp = trialEnds ? wibEpoch(s2(trialEnds)) : NaN;
    if (!trialEnds || now > exp) return { ok: false, code: "TRIAL_EXPIRED" };
    return { ok: true, code: "TRIAL_ACTIVE" };
  }
  return { ok: false, code: "NO_SUBSCRIPTION" };
}
__name(planStatus, "planStatus");
var USER_SELECT = "SELECT id, username, role, kelas, nama_lengkap AS namaLengkap, nip, plan_type AS planType, trial_ends_at AS trialEndsAt, subscription_expires_at AS subscriptionExpiresAt FROM users";
function s2(v) {
  return v === null || v === void 0 ? "" : String(v);
}
__name(s2, "s");
var STATUS_MESSAGES = {
  TRIAL_EXPIRED: "Masa trial berakhir. Silakan berlangganan.",
  SUBSCRIPTION_EXPIRED: "Langganan berakhir. Perbarui langganan Anda.",
  NO_SUBSCRIPTION: "Aktifkan langganan untuk melanjutkan."
};
async function checkUserAccess(c, db) {
  const env2 = c.env;
  const secret = getJwtSecret(env2);
  if (!secret) {
    return { ok: false, status: 500, body: { success: false, message: "JWT_SECRET belum dikonfigurasi", code: "SERVER_ERROR" } };
  }
  const token = (c.req.header("authorization") || "").replace(/^Bearer /i, "");
  const payload = token ? await verifyJwt(token, secret) : null;
  if (!payload) {
    return { ok: false, status: 401, body: { success: false, message: "Token tidak valid atau kedaluwarsa", code: "UNAUTHORIZED" } };
  }
  const user = await one(db, USER_SELECT + " WHERE id=?", [payload.sub]);
  if (!user) {
    return { ok: false, status: 401, body: { success: false, message: "User tidak ditemukan", code: "UNAUTHORIZED" } };
  }
  const st = planStatus(user);
  if (!st.ok) {
    return {
      ok: false,
      status: 403,
      body: { success: false, message: STATUS_MESSAGES[st.code] || "Langganan tidak aktif", code: st.code }
    };
  }
  return { ok: true, user };
}
__name(checkUserAccess, "checkUserAccess");
async function requireActiveSubscription(c, next) {
  const r = await checkUserAccess(c, c.env.DB);
  if (!r.ok) return c.json(r.body, r.status);
  c.set("user", r.user);
  await next();
}
__name(requireActiveSubscription, "requireActiveSubscription");
var ADMIN_ROLES = /* @__PURE__ */ new Set(["SuperAdmin", "super_admin"]);
async function requireSuperAdmin(c, next) {
  const r = await checkUserAccess(c, c.env.DB);
  if (!r.ok) return c.json(r.body, r.status);
  if (!ADMIN_ROLES.has(String(r.user.role || ""))) {
    return c.json({ success: false, message: "Akses ditolak. Hanya Super Admin.", code: "FORBIDDEN" }, 403);
  }
  c.set("user", r.user);
  await next();
}
__name(requireSuperAdmin, "requireSuperAdmin");

// src/api/routes.ts
function ok(data, message = "OK") {
  return { success: true, data, message };
}
__name(ok, "ok");
function genUniqueId() {
  const now = /* @__PURE__ */ new Date();
  const ym = String(now.getFullYear()).slice(2) + String(now.getMonth() + 1).padStart(2, "0");
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  let r = "";
  const rnd = new Uint8Array(4);
  crypto.getRandomValues(rnd);
  for (let i = 0; i < 4; i++) r += chars[rnd[i] % chars.length];
  return `GRU-${ym}-${r}`;
}
__name(genUniqueId, "genUniqueId");
function err(message, status = 400) {
  return { success: false, message, _status: status };
}
__name(err, "err");
function json(v, status = 200) {
  return new Response(JSON.stringify(v), {
    status,
    headers: { "Content-Type": "application/json; charset=utf-8" }
  });
}
__name(json, "json");
function fail(message, status = 400) {
  return json(err(message, status), status);
}
__name(fail, "fail");
async function getBody(c) {
  const ct = c.req.header("content-type") || "";
  if (ct.includes("json")) {
    try {
      return await c.req.json();
    } catch {
      return {};
    }
  }
  try {
    return await c.req.parseBody();
  } catch {
    return {};
  }
}
__name(getBody, "getBody");
function getParam(c, key) {
  const q = c.req.query(key);
  if (q !== void 0 && q !== null && q !== "") return q;
  const p = c.get("_body") || {};
  const v = p[key];
  return v === void 0 || v === null ? "" : String(v);
}
__name(getParam, "getParam");
function wibToEpoch(ts) {
  return (/* @__PURE__ */ new Date(ts.replace(" ", "T") + "Z")).getTime() - 7 * 3600 * 1e3;
}
__name(wibToEpoch, "wibToEpoch");
function addMinutesWib(ts, mins) {
  const ms = wibToEpoch(ts) + mins * 60 * 1e3 + 7 * 3600 * 1e3;
  const d = new Date(ms);
  const p = /* @__PURE__ */ __name((n) => String(n).padStart(2, "0"), "p");
  return `${d.getUTCFullYear()}-${p(d.getUTCMonth() + 1)}-${p(d.getUTCDate())} ${p(d.getUTCHours())}:${p(d.getUTCMinutes())}:${p(d.getUTCSeconds())}`;
}
__name(addMinutesWib, "addMinutesWib");
function siswaFields(src) {
  const map = [
    ["ttl", "ttl"],
    ["alamat", "alamat"],
    ["noWa", "no_wa"],
    ["ekstra", "ekstra"],
    ["namaAyah", "nama_ayah"],
    ["namaIbu", "nama_ibu"],
    ["kerjaAyah", "kerja_ayah"],
    ["kerjaIbu", "kerja_ibu"],
    ["penghasilanOrtu", "penghasilan_ortu"]
  ];
  const out = {};
  for (const [k, col] of map) out[col] = s(src[k]);
  return out;
}
__name(siswaFields, "siswaFields");
async function registerRoutes(app2) {
  const handle = /* @__PURE__ */ __name(async (c) => {
    const db = c.env.DB;
    const action = getParam(c, "action") || c.req.param("action") || "";
    const method = c.req.method.toUpperCase();
    if (method === "POST" || method === "PUT" || method === "DELETE") {
      const b = await getBody(c);
      if (c.env.DEBUG) console.error("[body]", JSON.stringify(b));
      c.set("_body", b);
    }
    try {
      return await dispatch(c, db, action, method);
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      if (c.env && c.env.DEBUG) console.error("[routes]", action, method, e);
      return fail("Database error: " + msg, 500);
    }
  }, "handle");
  app2.get("/api", handle);
  app2.post("/api", handle);
  app2.put("/api", handle);
  app2.delete("/api", handle);
  app2.all("/api/:action", async (c) => {
    if (!getParam(c, "action")) {
      return fail("Parameter action wajib diisi", 400);
    }
    return handle(c);
  });
}
__name(registerRoutes, "registerRoutes");
async function dispatch(c, db, action, method) {
  const body = c.get("_body") || {};
  const P = /* @__PURE__ */ __name((k) => getParam(c, k), "P");
  switch (action) {
    // ===================== AUTH =====================
    case "login": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const u = s(body.username);
      const p = s(body.password);
      if (!u || !p) return fail("Username dan password wajib diisi");
      const user = await one(db, "SELECT id, username, password, role, kelas, nama_lengkap AS namaLengkap, nip, plan_type AS planType, trial_ends_at AS trialEndsAt, subscription_expires_at AS subscriptionExpiresAt FROM users WHERE username=?", [u]);
      if (!user) return fail("Username atau password salah", 401);
      const stored = s(user.password);
      let valid = await verifyPassword(p, stored);
      if (!valid && !stored.startsWith("$2")) {
      }
      if (!valid) return fail("Username atau password salah", 401);
      if (!stored.startsWith("$2") && !stored.startsWith("$pbkdf2$")) {
        try {
          const h = await hashPassword(p);
          await run(db, "UPDATE users SET password=? WHERE id=?", [h, user.id]);
        } catch {
        }
      }
      const { password: _pw, ...rest } = user;
      const roles = [rest.role];
      if (rest.nip && rest.role === "Walikelas") roles.push("Guru");
      const token = await signJwt({ sub: rest.id, username: rest.username, role: rest.role }, getJwtSecret(c.env));
      return json(ok({
        ...rest,
        planType: rest.planType || "free",
        trialEndsAt: rest.trialEndsAt || null,
        subscriptionExpiresAt: rest.subscriptionExpiresAt || null,
        token,
        roles
      }, "Login berhasil"));
    }
    // ===================== REGISTER (free trial) =====================
    case "register": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const u = s(body.username).trim();
      const p = s(body.password);
      const nama = s(body.namaLengkap || body.nama).trim();
      const email = s(body.email).trim().toLowerCase();
      if (!u || !p) return fail("Username dan password wajib diisi");
      if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return fail("Email tidak valid");
      let role = s(body.role);
      if (role !== "Guru" && role !== "Walikelas") role = "Guru";
      const kelas = role === "Walikelas" ? s(body.kelas).trim() : "";
      const ck = await one(db, "SELECT id FROM users WHERE username=?", [u]);
      if (ck) return fail("Username sudah dipakai");
      const hash = await hashPassword(p);
      const trialEndsAt = fmtWIB(Date.now() + 30 * 24 * 3600 * 1e3);
      const uniqueId = genUniqueId();
      await insertId(
        db,
        "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip,email,unique_id,plan_type,trial_ends_at) VALUES (?,?,?,?,?,?,?,?,?,?)",
        [u, hash, role, kelas, nama, "", email || null, uniqueId, "trial", trialEndsAt]
      );
      return json(ok({ username: u, role, planType: "trial", trialEndsAt, unique_id: uniqueId }, "Registrasi berhasil. Trial 30 hari aktif."));
    }
    // ===================== PLAN (get own / admin set) =====================
    case "plan": {
      if (method === "GET") {
        const check = await checkUserAccess(c, db);
        if (!check.ok) return json(check.body, check.status);
        return json(ok(check.user));
      }
      if (method === "PUT") {
        const check = await checkUserAccess(c, db);
        if (!check.ok) return json(check.body, check.status);
        if (check.user.role !== "SuperAdmin") return fail("Hanya SuperAdmin", 403);
        const id = s(body.id) || P("id");
        const username = s(body.username) || P("username");
        const target = id ? await one(db, "SELECT id FROM users WHERE id=?", [id]) : username ? await one(db, "SELECT id FROM users WHERE username=?", [username]) : null;
        if (!target) return fail("User tidak ditemukan");
        const plan = s(body.plan_type);
        if (!["free", "trial", "premium"].includes(plan)) return fail("plan_type tidak valid");
        const durDays = [30, 180].includes(num(body.duration_days)) ? num(body.duration_days) : 30;
        const trialDays = num(body.trial_days) || 7;
        let trialEndsAt = null;
        let subExpiresAt = null;
        if (plan === "trial") trialEndsAt = fmtWIB(Date.now() + trialDays * 864e5);
        if (plan === "premium") subExpiresAt = fmtWIB(Date.now() + durDays * 864e5);
        await run(db, "UPDATE users SET plan_type=?, trial_ends_at=?, subscription_expires_at=? WHERE id=?", [plan, trialEndsAt, subExpiresAt, target.id]);
        return json(ok(null, "Plan " + username + " \u2192 " + plan));
      }
      return fail("Method not allowed", 405);
    }
    case "test": {
      const r = await one(db, "SELECT COUNT(*) AS c FROM users");
      return json(ok({ db: "ok", users: num(r?.c) }, "Koneksi berhasil"));
    }
    // ===================== SETUP =====================
    case "setup": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const ddl = [
        `CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL, role TEXT NOT NULL, kelas TEXT, nama_lengkap TEXT, nip TEXT)`,
        `CREATE TABLE IF NOT EXISTS siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nis TEXT NOT NULL, nama_siswa TEXT NOT NULL, kelas TEXT, jk TEXT, ttl TEXT DEFAULT '', alamat TEXT DEFAULT '', no_wa TEXT DEFAULT '', ekstra TEXT DEFAULT '', nama_ayah TEXT DEFAULT '', nama_ibu TEXT DEFAULT '', kerja_ayah TEXT DEFAULT '', kerja_ibu TEXT DEFAULT '', penghasilan_ortu TEXT DEFAULT '')`,
        `CREATE TABLE IF NOT EXISTS guru (id INTEGER PRIMARY KEY AUTOINCREMENT, nip TEXT NOT NULL, nama_guru TEXT, mapel TEXT, kelas_diampu TEXT)`,
        `CREATE TABLE IF NOT EXISTS kehadiran (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, nis TEXT, kelas TEXT, status TEXT, keterangan TEXT)`,
        `CREATE TABLE IF NOT EXISTS tatatertib (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, nis TEXT, pelanggaran TEXT, poin INTEGER, kelas TEXT)`,
        `CREATE TABLE IF NOT EXISTS kaskelas (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, kelas TEXT, jenis TEXT, jumlah REAL, keterangan TEXT)`,
        `CREATE TABLE IF NOT EXISTS struktur_kelas (id INTEGER PRIMARY KEY AUTOINCREMENT, kelas TEXT, jabatan TEXT, nis TEXT, nama_siswa TEXT)`,
        `CREATE TABLE IF NOT EXISTS inventaris (id INTEGER PRIMARY KEY AUTOINCREMENT, kelas TEXT, nama_barang TEXT, jumlah INTEGER, kondisi TEXT, keterangan TEXT, tanggal TEXT)`,
        `CREATE TABLE IF NOT EXISTS pengumuman (id INTEGER PRIMARY KEY AUTOINCREMENT, kelas TEXT, judul TEXT, isi TEXT, tanggal TEXT, penulis TEXT)`,
        `CREATE TABLE IF NOT EXISTS jadwal_pelajaran (id INTEGER PRIMARY KEY AUTOINCREMENT, kelas TEXT, hari TEXT, jam_ke INTEGER, mata_pelajaran TEXT, nip TEXT)`,
        `CREATE TABLE IF NOT EXISTS jadwal_piket (id INTEGER PRIMARY KEY AUTOINCREMENT, kelas TEXT, hari TEXT, nis TEXT, nama_siswa TEXT)`,
        `CREATE TABLE IF NOT EXISTS jurnal_bimbingan (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, kelas TEXT, kategori TEXT, isi TEXT, tindak_lanjut TEXT)`,
        `CREATE TABLE IF NOT EXISTS jurnal_mengajar (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, kelas TEXT, nip TEXT, mapel TEXT, jam_ke INTEGER, materi TEXT, kegiatan TEXT)`,
        `CREATE TABLE IF NOT EXISTS presensi_mapel (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, kelas TEXT, nis TEXT, nip TEXT, mapel TEXT, status TEXT, jam_ke INTEGER, created_at TEXT, updated_at TEXT)`,
        `CREATE TABLE IF NOT EXISTS nilai (id INTEGER PRIMARY KEY AUTOINCREMENT, nis TEXT, kelas TEXT, nip TEXT, mapel TEXT, jenis TEXT, nilai REAL, tanggal TEXT)`,
        `CREATE TABLE IF NOT EXISTS katalog_alat (id INTEGER PRIMARY KEY AUTOINCREMENT, kode TEXT, nama_barang TEXT, spesifikasi TEXT, jumlah INTEGER, kondisi TEXT, lokasi TEXT)`,
        `CREATE TABLE IF NOT EXISTS bahan_praktik (id INTEGER PRIMARY KEY AUTOINCREMENT, kode TEXT, nama_bahan TEXT, satuan TEXT, stok REAL, stok_min REAL, kategori TEXT)`,
        `CREATE TABLE IF NOT EXISTS peminjaman (id INTEGER PRIMARY KEY AUTOINCREMENT, id_pinjam TEXT, kode_barang TEXT, nama_barang TEXT, peminjam TEXT, jenis_peminjam TEXT, tgl_pinjam TEXT, batas_waktu TEXT, status TEXT, tgl_kembali TEXT)`,
        `CREATE TABLE IF NOT EXISTS laporan_kerusakan (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, kode_barang TEXT, nama_barang TEXT, kerusakan TEXT, pelapor TEXT, status TEXT, jadwal_maintenance TEXT)`,
        `CREATE TABLE IF NOT EXISTS kunjungan_rumah (id INTEGER PRIMARY KEY AUTOINCREMENT, tanggal TEXT, nis TEXT, kelas TEXT, nama_siswa TEXT, alamat TEXT, hasil TEXT, tindak_lanjut TEXT, petugas TEXT)`,
        `CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY AUTOINCREMENT, setting_key TEXT NOT NULL UNIQUE, setting_value TEXT)`,
        `CREATE TABLE IF NOT EXISTS log_aktivitas (id INTEGER PRIMARY KEY AUTOINCREMENT, waktu TEXT, username TEXT, role TEXT, aksi TEXT, detail TEXT)`
      ];
      let okCount = 0;
      const errs = [];
      for (const sql of ddl) {
        try {
          await run(db, sql);
          okCount++;
        } catch (e) {
          errs.push(String(e instanceof Error ? e.message : e));
        }
      }
      try {
        const u = await one(db, "SELECT COUNT(*) AS c FROM users");
        if (num(u?.c) === 0) {
          const seed = [
            ["admin", await hashPassword("admin123"), "SuperAdmin", "ALL", "Administrator", "", "free", null, null],
            ["walas7a", await hashPassword("guru123"), "Walikelas", "7A", "Siti Aminah, S.Pd", "19850101", "premium", null, "2099-12-31 23:59:59"],
            ["19850101", await hashPassword("guru123"), "Guru", "GURU", "Siti Aminah, S.T", "19850101", "premium", null, "2099-12-31 23:59:59"],
            ["toolman", await hashPassword("tool123"), "Toolman", "TKJ", "Andi Prasetyo", "", "free", null, null],
            ["sekret7a", await hashPassword("sekret123"), "Sekretaris", "7A", "Dewi Lestari", "", "free", null, null],
            ["benda7a", await hashPassword("benda123"), "Bendahara", "7A", "Ahmad Fauzi", "", "free", null, null],
            ["ketua7a", await hashPassword("ketua123"), "Ketua", "7A", "Budi Santoso", "", "free", null, null],
            ["001", await hashPassword("siswa123"), "Siswa", "7A", "Ahmad Rizki", "", "free", null, null],
            ["002", await hashPassword("siswa123"), "Siswa", "7A", "Siti Nurhaliza", "", "free", null, null]
          ];
          for (const r of seed) await run(db, "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip,plan_type,trial_ends_at,subscription_expires_at) VALUES (?,?,?,?,?,?,?,?,?)", r);
        }
        const st = await one(db, "SELECT COUNT(*) AS c FROM settings");
        if (num(st?.c) === 0) {
          await run(db, "INSERT INTO settings (setting_key,setting_value) VALUES ('TA_AKTIF','2025/2026'),('SEMESTER','1')");
        }
        const g = await one(db, "SELECT COUNT(*) AS c FROM guru");
        if (num(g?.c) === 0) {
          await run(db, "INSERT INTO guru (nip,nama_guru,mapel) VALUES ('19850101','Siti Aminah, S.T','Produktif TKJ')");
        }
      } catch (e) {
        errs.push("seed: " + String(e instanceof Error ? e.message : e));
      }
      return json(ok({ tabel_ok: okCount, tabel_gagal: ddl.length - okCount, errors: errs }, "Setup selesai"));
    }
    case "setup-guru-v2": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const done = [];
      const errs = [];
      const cols = [
        ["presensi_mapel", "jam_ke", "INTEGER"],
        ["presensi_mapel", "created_at", "TEXT"],
        ["presensi_mapel", "updated_at", "TEXT"]
      ];
      for (const [t, col, typ] of cols) {
        try {
          await run(db, `ALTER TABLE ${t} ADD COLUMN ${col} ${typ}`);
          done.push(`${t}.${col}`);
        } catch (e) {
          const m = String(e instanceof Error ? e.message : e).toLowerCase();
          if (m.includes("duplicate column") || m.includes("already exists")) done.push(`${col} (sudah ada)`);
          else errs.push(`${col}: ${m}`);
        }
      }
      return json(ok({ ditambahkan: done, errors: errs }, "Setup Guru V2 selesai"));
    }
    case "setup-siswa-v2": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const done = [];
      const errs = [];
      const cols = [
        ["ttl", "TEXT DEFAULT ''"],
        ["alamat", "TEXT DEFAULT ''"],
        ["no_wa", "TEXT DEFAULT ''"],
        ["ekstra", "TEXT DEFAULT ''"],
        ["nama_ayah", "TEXT DEFAULT ''"],
        ["nama_ibu", "TEXT DEFAULT ''"],
        ["kerja_ayah", "TEXT DEFAULT ''"],
        ["kerja_ibu", "TEXT DEFAULT ''"],
        ["penghasilan_ortu", "TEXT DEFAULT ''"]
      ];
      for (const [col, typ] of cols) {
        try {
          await run(db, `ALTER TABLE siswa ADD COLUMN ${col} ${typ}`);
          done.push(`siswa.${col}`);
        } catch (e) {
          const m = String(e instanceof Error ? e.message : e).toLowerCase();
          if (m.includes("duplicate column") || m.includes("already exists")) done.push(`${col} (sudah ada)`);
          else errs.push(`${col}: ${m}`);
        }
      }
      return json(ok({ ditambahkan: done, errors: errs }, "Setup Siswa V2 selesai"));
    }
    // ===================== DASHBOARD =====================
    case "dashboard": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      const role = P("role");
      const nip = P("nip");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const today = todayWIB();
      const dayName = hariWIB();
      const totalSiswa = num((await one(db, "SELECT COUNT(*) AS c FROM siswa WHERE kelas=?", [kelas]))?.c);
      const kRows = await all(db, "SELECT status, COUNT(*) AS c FROM kehadiran WHERE kelas=? AND tanggal=? GROUP BY status", [kelas, today]);
      const kh = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
      for (const r of kRows) {
        const st = s(r.status);
        if (st in kh) kh[st] = num(r.c);
      }
      const absent = await all(
        db,
        `SELECT s.nis, s.nama_siswa AS nama, COALESCE(k.status, 'Belum Absen') AS status
         FROM siswa s LEFT JOIN kehadiran k ON s.nis = k.nis AND k.tanggal = ?
         WHERE s.kelas = ? AND (k.status IS NULL OR k.status <> 'Hadir')`,
        [today, kelas]
      );
      const chartRows = await all(
        db,
        "SELECT tanggal, status, COUNT(*) AS c FROM kehadiran WHERE kelas=? GROUP BY tanggal,status ORDER BY tanggal DESC LIMIT 70",
        [kelas]
      );
      const byDate = {};
      for (const r of chartRows) {
        const d = s(r.tanggal);
        if (!byDate[d]) byDate[d] = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
        const st = s(r.status);
        if (byDate[d][st] !== void 0) byDate[d][st] = num(r.c);
      }
      let dates = Object.keys(byDate).sort().slice(-7);
      const chart = { labels: [], hadir: [], absent: [] };
      for (const d of dates) {
        const p = d.split("-");
        chart.labels.push(`${parseInt(p[2], 10)} ${["", "Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"][parseInt(p[1], 10)]}`);
        chart.hadir.push(byDate[d].Hadir);
        chart.absent.push(byDate[d].Sakit + byDate[d].Izin + byDate[d].Alfa);
      }
      const pengumuman = await all(db, "SELECT id AS row, judul, isi, tanggal, penulis FROM pengumuman WHERE kelas=? ORDER BY tanggal DESC, id DESC LIMIT 3", [kelas]);
      const piket = await all(db, "SELECT nis, nama_siswa AS nama FROM jadwal_piket WHERE kelas=? AND hari=?", [kelas, dayName]);
      const result = {
        today,
        totalSiswa,
        hadir: kh.Hadir,
        sakit: kh.Sakit,
        izin: kh.Izin,
        alfa: kh.Alfa,
        absentStudents: absent,
        chart,
        pengumuman,
        hariIni: dayName,
        todayPiket: piket,
        todaySchedule: []
      };
      if (role === "Guru" && nip) {
        result.todaySchedule = await all(
          db,
          "SELECT kelas, jam_ke AS jamKe, mata_pelajaran AS mapel FROM jadwal_pelajaran WHERE nip=? AND hari=? ORDER BY jam_ke",
          [nip, dayName]
        );
      } else {
        result.todaySchedule = await all(
          db,
          "SELECT jam_ke AS jamKe, mata_pelajaran AS mapel, nip AS guru FROM jadwal_pelajaran WHERE kelas=? AND hari=? ORDER BY jam_ke",
          [kelas, dayName]
        );
      }
      return json(ok(result));
    }
    case "dashboard-rekap": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      const role = P("role");
      const nip = P("nip");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const r = {};
      r.totalSiswa = num((await one(db, "SELECT COUNT(*) AS c FROM siswa WHERE kelas=?", [kelas]))?.c);
      r.totalPelanggaran = num((await one(db, "SELECT COUNT(*) AS c FROM tatatertib WHERE kelas=?", [kelas]))?.c);
      const kas = await one(db, "SELECT COALESCE(SUM(CASE WHEN jenis='Masuk' THEN jumlah ELSE 0 END),0) AS m, COALESCE(SUM(CASE WHEN jenis='Keluar' THEN jumlah ELSE 0 END),0) AS k FROM kaskelas WHERE kelas=?", [kelas]);
      r.saldoKas = num(kas?.m) - num(kas?.k);
      r.totalPengumuman = num((await one(db, "SELECT COUNT(*) AS c FROM pengumuman WHERE kelas=?", [kelas]))?.c);
      r.totalInventaris = num((await one(db, "SELECT COUNT(*) AS c FROM inventaris WHERE kelas=?", [kelas]))?.c);
      r.totalBimbingan = num((await one(db, "SELECT COUNT(*) AS c FROM jurnal_bimbingan WHERE kelas=?", [kelas]))?.c);
      if (role === "Guru" && nip) {
        r.totalJurnalMengajar = num((await one(db, "SELECT COUNT(*) AS c FROM jurnal_mengajar WHERE nip=?", [nip]))?.c);
        r.kelasDiampu = num((await one(db, "SELECT COUNT(DISTINCT kelas) AS c FROM jadwal_pelajaran WHERE nip=?", [nip]))?.c);
      }
      if (role === "Toolman") {
        r.totalAlat = num((await one(db, "SELECT COUNT(*) AS c FROM katalog_alat"))?.c);
        r.totalBahan = num((await one(db, "SELECT COUNT(*) AS c FROM bahan_praktik"))?.c);
        r.lowStock = num((await one(db, "SELECT COUNT(*) AS c FROM bahan_praktik WHERE stok <= stok_min"))?.c);
        r.pinjamAktif = num((await one(db, "SELECT COUNT(*) AS c FROM peminjaman WHERE status='Dipinjam'"))?.c);
      }
      return json(ok(r));
    }
    case "early-warning": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const alfaRows = await all(db, "SELECT nis, COUNT(*) AS c FROM kehadiran WHERE kelas=? AND status='Alfa' GROUP BY nis", [kelas]);
      const alfa = {};
      for (const x of alfaRows) alfa[s(x.nis)] = num(x.c);
      const avgRows = await all(db, "SELECT nis, AVG(nilai) AS a FROM nilai WHERE kelas=? GROUP BY nis", [kelas]);
      const avg = {};
      for (const x of avgRows) avg[s(x.nis)] = Math.round(num(x.a) * 10) / 10;
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=?", [kelas]);
      const res = [];
      for (const sis of siswa) {
        const a = alfa[s(sis.nis)] ?? 0;
        const v = avg[s(sis.nis)] ?? null;
        const m = [];
        if (a > 3) m.push("Alfa " + a + "x");
        if (v !== null && v < 70) m.push("Rata-rata " + v);
        if (m.length) res.push({ nis: sis.nis, nama: sis.nama, alfa: a, avg: v, masalah: m.join(" | ") });
      }
      return json(ok(res));
    }
    // ===================== GURU INFO =====================
    case "guru-info": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      if (!nip) return fail("Parameter nip wajib diisi");
      let info3 = await one(db, "SELECT nip, nama_guru, nama_guru AS nama, mapel, kelas_diampu FROM guru WHERE nip=?", [nip]);
      if (!info3) {
        const u = await one(db, "SELECT nama_lengkap FROM users WHERE username=?", [nip]);
        if (u) info3 = { nip, nama_guru: u.nama_lengkap, nama: u.nama_lengkap, mapel: "", kelas_diampu: "" };
      }
      const set = /* @__PURE__ */ new Set();
      if (info3 && info3.kelas_diampu) {
        for (const k of String(info3.kelas_diampu).split(",")) {
          const t = k.trim();
          if (t !== "") set.add(t);
        }
      }
      const jRows = await all(db, "SELECT DISTINCT kelas FROM jadwal_pelajaran WHERE nip=?", [nip]);
      for (const x of jRows) if (x.kelas) set.add(s(x.kelas));
      return json(ok({ info: info3, kelasDiampu: Array.from(set) }));
    }
    case "guru-add-kelas": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const nip = body.nip ?? P("nip");
      const kelas = body.kelas ?? P("kelas");
      if (!nip || !kelas) return fail("nip dan kelas wajib diisi");
      const g = await one(db, "SELECT id, kelas_diampu FROM guru WHERE nip=?", [nip]);
      if (g) {
        const ex = String(g.kelas_diampu || "").split(",").map((x) => x.trim()).filter(Boolean);
        if (!ex.includes(kelas)) {
          ex.push(kelas);
          await run(db, "UPDATE guru SET kelas_diampu=? WHERE nip=?", [ex.join(","), nip]);
        }
      } else {
        await run(db, "INSERT INTO guru (nip,nama_guru,mapel,kelas_diampu) VALUES (?,?,?,?)", [nip, "", "", kelas]);
      }
      return json(ok(null, "Kelas " + kelas + " ditambahkan"));
    }
    case "mapel-guru-kelas": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      if (!nip || !kelas) return fail("nip dan kelas wajib diisi");
      const rows = await all(db, "SELECT DISTINCT mata_pelajaran AS mapel FROM jadwal_pelajaran WHERE nip=? AND kelas=?", [nip, kelas]);
      return json(ok(rows.map((r) => r.mapel)));
    }
    case "wali-kelas": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const r = await one(db, "SELECT nama_lengkap AS nama FROM users WHERE role='Walikelas' AND kelas=? LIMIT 1", [kelas]);
      return json(ok({ nama: r ? r.nama : "-" }));
    }
    case "wali-kelas-all": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const rows = await all(db, "SELECT kelas, nama_lengkap AS nama FROM users WHERE role='Walikelas' AND kelas IS NOT NULL AND kelas<>''");
      return json(ok(rows));
    }
    // ===================== SISWA =====================
    case "siswa-options": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const rows = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
      return json(ok(rows));
    }
    case "siswa": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(
          db,
          `SELECT id AS row, nis, nama_siswa AS nama, kelas, jk, ttl, alamat, no_wa AS noWa, ekstra,
                  nama_ayah AS namaAyah, nama_ibu AS namaIbu, kerja_ayah AS kerjaAyah, kerja_ibu AS kerjaIbu,
                  penghasilan_ortu AS penghasilanOrtu
           FROM siswa WHERE kelas=? ORDER BY nama_siswa`,
          [kelas]
        );
        return json(ok(rows));
      }
      if (method === "POST") {
        const nis = s(body.nis);
        const nama = s(body.nama);
        const jk = s(body.jk) || "L";
        if (!nis || !nama) return fail("NIS dan Nama wajib diisi");
        const sf = siswaFields(body);
        await run(
          db,
          "INSERT INTO siswa (nis,nama_siswa,kelas,jk,ttl,alamat,no_wa,ekstra,nama_ayah,nama_ibu,kerja_ayah,kerja_ibu,penghasilan_ortu) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [nis, nama, kelas, jk, sf.ttl, sf.alamat, sf.no_wa, sf.ekstra, sf.nama_ayah, sf.nama_ibu, sf.kerja_ayah, sf.kerja_ibu, sf.penghasilan_ortu]
        );
        const ck = await one(db, "SELECT id FROM users WHERE username=?", [nis]);
        if (!ck) {
          const h = await hashPassword("siswa123");
          await run(db, "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip) VALUES (?,?,?,?,?,?)", [nis, h, "Siswa", kelas, nama, ""]);
        }
        return json(ok(null, "Siswa ditambahkan (+akun login: " + nis + " / siswa123)"));
      }
      if (method === "PUT") {
        const old = s(body.oldNis);
        const nis = s(body.nis);
        const nama = s(body.nama);
        const jk = s(body.jk) || "L";
        const k = kelas || s(body.kelas);
        const sf = siswaFields(body);
        await run(
          db,
          "UPDATE siswa SET nis=?,nama_siswa=?,jk=?,ttl=?,alamat=?,no_wa=?,ekstra=?,nama_ayah=?,nama_ibu=?,kerja_ayah=?,kerja_ibu=?,penghasilan_ortu=? WHERE nis=? AND kelas=?",
          [nis, nama, jk, sf.ttl, sf.alamat, sf.no_wa, sf.ekstra, sf.nama_ayah, sf.nama_ibu, sf.kerja_ayah, sf.kerja_ibu, sf.penghasilan_ortu, old, k]
        );
        if (old !== nis) {
          await run(db, "UPDATE users SET username=?,nama_lengkap=?,kelas=? WHERE username=? AND role='Siswa'", [nis, nama, k, old]);
        } else {
          await run(db, "UPDATE users SET nama_lengkap=?,kelas=? WHERE username=? AND role='Siswa'", [nama, k, nis]);
        }
        return json(ok(null, "Siswa diperbarui (+akun ikut terupdate)"));
      }
      if (method === "DELETE") {
        const nis = P("nis") || s(body.nis);
        const k = kelas || s(body.kelas);
        if (k) await run(db, "DELETE FROM siswa WHERE nis=? AND kelas=?", [nis, k]);
        else await run(db, "DELETE FROM siswa WHERE nis=?", [nis]);
        await run(db, "DELETE FROM users WHERE username=? AND role='Siswa'", [nis]);
        return json(ok(null, "Siswa & akun login dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "siswa-import": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const kelas = s(body.kelas) || P("kelas");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const data = Array.isArray(body.data) ? body.data : [];
      const exN = new Set((await all(db, "SELECT nis FROM siswa")).map((r) => s(r.nis)));
      const exU = new Set((await all(db, "SELECT username FROM users")).map((r) => s(r.username)));
      const hashSiswa = await hashPassword("siswa123");
      let ins = 0;
      let skip = 0;
      for (const r of data) {
        const nis = s(r.nis).trim();
        const nama = s(r.nama).trim();
        let jk = s(r.jk).trim().toUpperCase();
        if (jk !== "L" && jk !== "P") jk = "L";
        const sf = siswaFields(r);
        if (!nis || !nama || exN.has(nis)) {
          skip++;
          continue;
        }
        await run(
          db,
          "INSERT INTO siswa (nis,nama_siswa,kelas,jk,ttl,alamat,no_wa,ekstra,nama_ayah,nama_ibu,kerja_ayah,kerja_ibu,penghasilan_ortu) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [nis, nama, kelas, jk, sf.ttl, sf.alamat, sf.no_wa, sf.ekstra, sf.nama_ayah, sf.nama_ibu, sf.kerja_ayah, sf.kerja_ibu, sf.penghasilan_ortu]
        );
        exN.add(nis);
        ins++;
        if (!exU.has(nis)) {
          await run(db, "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip) VALUES (?,?,?,?,?,?)", [nis, hashSiswa, "Siswa", kelas, nama, ""]);
          exU.add(nis);
        }
      }
      return json(ok({ inserted: ins, skipped: skip }, "Import " + ins + " siswa (+akun login otomatis: NIS/siswa123)" + (skip ? " (" + skip + " dilewati)" : "")));
    }
    // ===================== KEHADIRAN =====================
    case "kehadiran": {
      const kelas = P("kelas") || s(body.kelas);
      const tgl = P("tanggal") || s(body.tanggal);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        if (!tgl) return fail("Parameter tanggal wajib diisi");
        const rows = await all(db, "SELECT id AS row, tanggal, nis, status, keterangan FROM kehadiran WHERE kelas=? AND tanggal=? ORDER BY nis", [kelas, tgl]);
        return json(ok(rows));
      }
      if (method === "POST") {
        if (!tgl) return fail("Parameter tanggal wajib diisi");
        const recs = Array.isArray(body.records) ? body.records : [];
        await run(db, "DELETE FROM kehadiran WHERE tanggal=? AND kelas=?", [tgl, kelas]);
        for (const r of recs) {
          await run(db, "INSERT INTO kehadiran (tanggal,nis,kelas,status,keterangan) VALUES (?,?,?,?,?)", [tgl, s(r.nis), kelas, s(r.status), s(r.keterangan)]);
        }
        return json(ok(null, "Kehadiran disimpan (" + recs.length + ")"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== TATIB / KAS / STRUKTUR / INVENTARIS / PENGUMUMAN =====================
    case "tatatertib": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, tanggal, nis, pelanggaran, poin, kelas FROM tatatertib WHERE kelas=? ORDER BY tanggal DESC, id DESC", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO tatatertib (tanggal,nis,pelanggaran,poin,kelas) VALUES (?,?,?,?,?)", [body.tanggal, s(body.nis), s(body.pelanggaran), num(body.poin), kelas]);
        return json(ok(null, "Ditambahkan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM tatatertib WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "kas": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, tanggal, jenis, jumlah, keterangan FROM kaskelas WHERE kelas=? ORDER BY tanggal DESC, id DESC", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO kaskelas (tanggal,kelas,jenis,jumlah,keterangan) VALUES (?,?,?,?,?)", [body.tanggal, kelas, s(body.jenis), num(body.jumlah), s(body.keterangan)]);
        return json(ok(null, "Transaksi ditambahkan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM kaskelas WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "kas-summary": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const r = await one(db, "SELECT COALESCE(SUM(CASE WHEN jenis='Masuk' THEN jumlah ELSE 0 END),0) AS m, COALESCE(SUM(CASE WHEN jenis='Keluar' THEN jumlah ELSE 0 END),0) AS k FROM kaskelas WHERE kelas=?", [kelas]);
      const m = num(r?.m);
      const k = num(r?.k);
      return json(ok({ totalMasuk: m, totalKeluar: k, saldo: m - k }));
    }
    case "struktur": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT jabatan, nis, nama_siswa AS nama FROM struktur_kelas WHERE kelas=?", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        const arr = Array.isArray(body.data) ? body.data : [];
        await run(db, "DELETE FROM struktur_kelas WHERE kelas=?", [kelas]);
        for (const r of arr) {
          if (r.jabatan && r.nama) {
            await run(db, "INSERT INTO struktur_kelas (kelas,jabatan,nis,nama_siswa) VALUES (?,?,?,?)", [kelas, s(r.jabatan), s(r.nis), s(r.nama)]);
          }
        }
        return json(ok(null, "Struktur disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    case "inventaris": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, nama_barang AS namaBarang, jumlah, kondisi, keterangan FROM inventaris WHERE kelas=?", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO inventaris (kelas,nama_barang,jumlah,kondisi,keterangan,tanggal) VALUES (?,?,?,?,?,?)", [kelas, s(body.nama), num(body.jumlah), s(body.kondisi), s(body.keterangan), todayWIB()]);
        return json(ok(null, "Ditambahkan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM inventaris WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "pengumuman": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, judul, isi, tanggal, penulis FROM pengumuman WHERE kelas=? ORDER BY tanggal DESC, id DESC", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO pengumuman (kelas,judul,isi,tanggal,penulis) VALUES (?,?,?,?,?)", [kelas, s(body.judul), s(body.isi), todayWIB(), s(body.penulis)]);
        return json(ok(null, "Pengumuman dipublikasikan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM pengumuman WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== JADWAL =====================
    case "jadwal": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(
          db,
          `SELECT id AS row, hari, jam_ke AS jamKe, mata_pelajaran AS mapel, nip AS kg FROM jadwal_pelajaran
           WHERE kelas=? ORDER BY CASE hari WHEN 'Senin' THEN 1 WHEN 'Selasa' THEN 2 WHEN 'Rabu' THEN 3 WHEN 'Kamis' THEN 4 WHEN 'Jumat' THEN 5 WHEN 'Sabtu' THEN 6 ELSE 7 END, jam_ke`,
          [kelas]
        );
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO jadwal_pelajaran (kelas,hari,jam_ke,mata_pelajaran,nip) VALUES (?,?,?,?,?)", [kelas, s(body.hari), num(body.jam), s(body.mapel), s(body.nip)]);
        return json(ok(null, "Jadwal ditambahkan"));
      }
      if (method === "PUT") {
        const id = s(body.id) || P("id");
        await run(db, "UPDATE jadwal_pelajaran SET kelas=?, hari=?, jam_ke=?, mata_pelajaran=?, nip=? WHERE id=?", [s(body.kelas), s(body.hari), num(body.jam), s(body.mapel), s(body.nip), id]);
        return json(ok(null, "Jadwal diperbarui"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM jadwal_pelajaran WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "jadwal-mengajar": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      if (!nip) return fail("Parameter nip wajib diisi");
      const rows = await all(db, "SELECT kelas, jam_ke AS jamKe, mata_pelajaran AS mapel FROM jadwal_pelajaran WHERE nip=? AND hari=? ORDER BY jam_ke", [nip, hariWIB()]);
      return json(ok(rows));
    }
    case "jadwal-by-guru": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      if (!nip) return fail("Parameter nip wajib diisi");
      const rows = await all(
        db,
        `SELECT id AS row, kelas, hari, jam_ke AS jamKe, mata_pelajaran AS mapel FROM jadwal_pelajaran
         WHERE nip=? ORDER BY CASE hari WHEN 'Senin' THEN 1 WHEN 'Selasa' THEN 2 WHEN 'Rabu' THEN 3 WHEN 'Kamis' THEN 4 WHEN 'Jumat' THEN 5 WHEN 'Sabtu' THEN 6 ELSE 7 END, jam_ke`,
        [nip]
      );
      return json(ok(rows));
    }
    case "jadwal-piket": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, hari, nis, nama_siswa AS nama FROM jadwal_piket WHERE kelas=?", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        const hari = s(body.hari) || P("hari");
        if (!hari) return fail("Parameter hari wajib diisi");
        const students = Array.isArray(body.students) ? body.students : [];
        await run(db, "DELETE FROM jadwal_piket WHERE kelas=? AND hari=?", [kelas, hari]);
        for (const st of students) {
          if (st.nama) await run(db, "INSERT INTO jadwal_piket (kelas,hari,nis,nama_siswa) VALUES (?,?,?,?)", [kelas, hari, s(st.nis), s(st.nama)]);
        }
        return json(ok(null, "Piket " + hari + " disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== BIMBINGAN / KUNJUNGAN =====================
    case "jurnal-bimbingan": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, tanggal, kategori, isi, tindak_lanjut AS tindakLanjut FROM jurnal_bimbingan WHERE kelas=? ORDER BY tanggal DESC, id DESC", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO jurnal_bimbingan (tanggal,kelas,kategori,isi,tindak_lanjut) VALUES (?,?,?,?,?)", [body.tanggal, kelas, s(body.kategori), s(body.isi), s(body.tindakLanjut)]);
        return json(ok(null, "Bimbingan dicatat"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM jurnal_bimbingan WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "kunjungan-rumah": {
      const kelas = P("kelas") || s(body.kelas);
      if (!kelas && (method === "GET" || method === "POST")) return fail("Parameter kelas wajib diisi");
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, tanggal, nis, nama_siswa AS nama, alamat, hasil, tindak_lanjut AS tl, petugas FROM kunjungan_rumah WHERE kelas=? ORDER BY tanggal DESC, id DESC", [kelas]);
        return json(ok(rows));
      }
      if (method === "POST") {
        const nv = s(body.nisNama).split("|");
        await run(db, "INSERT INTO kunjungan_rumah (tanggal,nis,kelas,nama_siswa,alamat,hasil,tindak_lanjut,petugas) VALUES (?,?,?,?,?,?,?,?)", [body.tanggal, nv[0] ?? "", kelas, nv[1] ?? "", s(body.alamat), s(body.hasil), s(body.tindakLanjut), s(body.petugas)]);
        return json(ok(null, "Kunjungan dicatat"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM kunjungan_rumah WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== JURNAL MENGAJAR =====================
    case "jurnal-mengajar": {
      if (method === "GET") {
        const nip = P("nip");
        if (!nip) return fail("Parameter nip wajib diisi");
        let sql = "SELECT id AS row, tanggal, kelas, mapel, jam_ke AS jamKe, materi, kegiatan FROM jurnal_mengajar WHERE nip=?";
        const p = [nip];
        const tgl = P("tanggal");
        if (tgl) {
          sql += " AND tanggal=?";
          p.push(tgl);
        }
        sql += " ORDER BY tanggal DESC, id DESC";
        const rows = await all(db, sql, p);
        return json(ok(rows));
      }
      if (method === "POST") {
        const nip = s(body.nip) || P("nip");
        if (!nip) return fail("Parameter nip wajib diisi");
        await run(db, "INSERT INTO jurnal_mengajar (tanggal,kelas,nip,mapel,jam_ke,materi,kegiatan) VALUES (?,?,?,?,?,?,?)", [body.tanggal, s(body.kelas), nip, s(body.mapel), num(body.jam), s(body.materi), s(body.kegiatan)]);
        return json(ok(null, "Jurnal disimpan"));
      }
      if (method === "DELETE") {
        const nip = s(body.nip) || P("nip");
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM jurnal_mengajar WHERE id=? AND nip=?", [id, nip]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== PRESENSI MAPEL =====================
    case "presensi-mapel": {
      if (method === "GET") {
        const nip = P("nip");
        const kelas = P("kelas");
        const tgl = P("tanggal");
        if (!nip || !kelas || !tgl) return fail("nip, kelas, tanggal wajib diisi");
        const rows = await all(db, "SELECT nis, status, mapel FROM presensi_mapel WHERE nip=? AND kelas=? AND tanggal=?", [nip, kelas, tgl]);
        return json(ok(rows));
      }
      if (method === "POST") {
        const nip = s(body.nip);
        const kelas = s(body.kelas);
        const mapel = s(body.mapel);
        const tgl = s(body.tanggal);
        const recs = Array.isArray(body.records) ? body.records : [];
        const jamKe = body.jamKe !== void 0 && body.jamKe !== "" ? num(body.jamKe) : null;
        if (!nip || !kelas || !mapel || !tgl) return fail("nip, kelas, mapel, tanggal wajib diisi");
        await run(db, "DELETE FROM presensi_mapel WHERE nip=? AND kelas=? AND tanggal=? AND mapel=?", [nip, kelas, tgl, mapel]);
        for (const r of recs) {
          await run(db, "INSERT INTO presensi_mapel (tanggal,kelas,nis,nip,mapel,status,jam_ke,created_at) VALUES (?,?,?,?,?,?,?,?)", [tgl, kelas, s(r.nis), nip, mapel, s(r.status), jamKe, nowWIB()]);
        }
        return json(ok(null, "Presensi " + recs.length + " siswa tersimpan pukul " + nowWIB().split(" ")[1] + " WIB"));
      }
      if (method === "PUT") {
        const updates = Array.isArray(body.updates) ? body.updates : [];
        if (!updates.length) return fail("Tidak ada baris untuk diperbarui");
        let n = 0;
        for (const u of updates) {
          if (!u.id || !u.status) continue;
          await run(db, "UPDATE presensi_mapel SET status=?, updated_at=? WHERE id=?", [s(u.status), nowWIB(), num(u.id)]);
          n++;
        }
        return json(ok(null, n + " baris presensi diperbarui (" + nowWIB().split(" ")[1] + " WIB)"));
      }
      return fail("Method not allowed", 405);
    }
    case "presensi-riwayat": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      if (!nip) return fail("Parameter nip wajib diisi");
      const tanggal = P("tanggal");
      const kelasF = P("kelas");
      let base = " FROM presensi_mapel p LEFT JOIN siswa s ON s.nis=p.nis LEFT JOIN jurnal_mengajar j ON j.nip=p.nip AND j.tanggal=p.tanggal AND j.kelas=p.kelas AND j.mapel=p.mapel WHERE p.nip=?";
      const p = [nip];
      if (tanggal) {
        base += " AND p.tanggal=?";
        p.push(tanggal);
      }
      if (kelasF) {
        base += " AND p.kelas=?";
        p.push(kelasF);
      }
      const tail = " ORDER BY p.tanggal DESC, p.kelas, j.jam_ke, s.nama_siswa";
      const sel = "SELECT p.id, p.tanggal, p.kelas, p.mapel, p.nis, p.status, s.nama_siswa AS nama, j.jam_ke AS jamKe, p.created_at AS createdAt, p.updated_at AS updatedAt";
      let rows = await all(db, sel + base + tail, p);
      if (!rows.length) {
        rows = await all(db, sel.replace(", p.created_at AS createdAt, p.updated_at AS updatedAt", ", NULL AS createdAt, NULL AS updatedAt") + base + tail, p);
      }
      const sessions = {};
      const order = [];
      for (const r of rows) {
        const key = s(r.tanggal) + "|" + s(r.kelas) + "|" + s(r.mapel);
        if (!sessions[key]) {
          sessions[key] = {
            tanggal: r.tanggal,
            kelas: r.kelas,
            mapel: r.mapel,
            jamKe: r.jamKe,
            createdAt: r.createdAt,
            updatedAt: null,
            summary: { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 },
            students: []
          };
          order.push(key);
        }
        const st = s(r.status);
        if (sessions[key].summary[st] !== void 0) sessions[key].summary[st]++;
        if (r.updatedAt && (!sessions[key].updatedAt || String(r.updatedAt) > String(sessions[key].updatedAt))) sessions[key].updatedAt = r.updatedAt;
        sessions[key].students.push({ id: r.id, nis: r.nis, nama: r.nama || r.nis, status: st, updatedAt: r.updatedAt });
      }
      let out = order.map((k) => sessions[k]);
      if (!tanggal && !kelasF) out = out.slice(0, 30);
      return json(ok(out));
    }
    // ===================== NILAI =====================
    case "nilai": {
      if (method === "GET") {
        const nip = P("nip");
        if (!nip) return fail("Parameter nip wajib diisi");
        const kelas = P("kelas");
        let rows;
        if (kelas) rows = await all(db, "SELECT id AS row, nis, kelas, mapel, jenis, nilai, tanggal FROM nilai WHERE nip=? AND kelas=?", [nip, kelas]);
        else rows = await all(db, "SELECT id AS row, nis, kelas, mapel, jenis, nilai, tanggal FROM nilai WHERE nip=?", [nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        const nip = s(body.nip);
        if (!nip) return fail("Parameter nip wajib diisi");
        await run(db, "INSERT INTO nilai (nis,kelas,nip,mapel,jenis,nilai,tanggal) VALUES (?,?,?,?,?,?,?)", [s(body.nis), s(body.kelas), nip, s(body.mapel), s(body.jenis), num(body.nilai), todayWIB()]);
        return json(ok(null, "Nilai disimpan"));
      }
      if (method === "DELETE") {
        const nip = s(body.nip) || P("nip");
        const id = P("id") || s(body.id);
        if (nip) await run(db, "DELETE FROM nilai WHERE id=? AND nip=?", [id, nip]);
        else await run(db, "DELETE FROM nilai WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "nilai-bulk": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const nip = s(body.nip);
      const kelas = s(body.kelas);
      const mapel = s(body.mapel);
      const entries = Array.isArray(body.entries) ? body.entries : [];
      if (!nip || !kelas || !mapel) return fail("nip, kelas, mapel wajib diisi");
      const seen = new Set(entries.map((e) => s(e.nis)));
      for (const n of seen) {
        await run(db, "DELETE FROM nilai WHERE nip=? AND kelas=? AND mapel=? AND nis=?", [nip, kelas, mapel, n]);
      }
      for (const e of entries) {
        if (e.nilai !== "" && e.nilai !== null && e.nilai !== void 0) {
          await run(db, "INSERT INTO nilai (nis,kelas,nip,mapel,jenis,nilai,tanggal) VALUES (?,?,?,?,?,?,?)", [s(e.nis), kelas, nip, mapel, s(e.jenis), num(e.nilai), todayWIB()]);
        }
      }
      return json(ok(null, "Nilai tersimpan"));
    }
    case "nilai-rekap": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      const mapel = P("mapel");
      if (!nip || !kelas) return fail("nip dan kelas wajib diisi");
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
      let sql = "SELECT nis, jenis, nilai FROM nilai WHERE nip=? AND kelas=?";
      const p = [nip, kelas];
      if (mapel) {
        sql += " AND mapel=?";
        p.push(mapel);
      }
      const rows = await all(db, sql, p);
      const map = {};
      for (const n of rows) {
        const key = s(n.nis);
        if (!map[key]) map[key] = {};
        map[key][s(n.jenis)] = num(n.nilai);
      }
      const jenisList = ["NH1", "NH2", "NH3", "NH4", "NH5", "NH6", "NH7", "NH8", "PSTS", "PSAS"];
      const res = [];
      for (const sis of siswa) {
        const row = { nis: sis.nis, nama: sis.nama };
        const vals = [];
        for (const j of jenisList) {
          const v = map[s(sis.nis)]?.[j] ?? null;
          row[j] = v;
          if (v !== null) vals.push(v);
        }
        row.akhir = vals.length ? Math.round(vals.reduce((a, b) => a + b, 0) / vals.length * 10) / 10 : null;
        res.push(row);
      }
      return json(ok({ students: res, mapel: mapel || "-", kelas }));
    }
    case "nilai-peringkat": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      const mapel = P("mapel");
      if (!nip || !kelas) return fail("nip dan kelas wajib diisi");
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=?", [kelas]);
      let sql = "SELECT nis, nilai FROM nilai WHERE nip=? AND kelas=?";
      const p = [nip, kelas];
      if (mapel) {
        sql += " AND mapel=?";
        p.push(mapel);
      }
      const rows = await all(db, sql, p);
      const map = {};
      for (const n of rows) {
        const key = s(n.nis);
        if (!map[key]) map[key] = [];
        map[key].push(num(n.nilai));
      }
      const res = [];
      for (const sis of siswa) {
        const vals = map[s(sis.nis)] ?? [];
        const avg = vals.length ? vals.reduce((a, b) => a + b, 0) / vals.length : 0;
        if (avg > 0) res.push({ nis: sis.nis, nama: sis.nama, avg: Math.round(avg * 10) / 10 });
      }
      res.sort((a, b) => num(b.avg) - num(a.avg));
      res.forEach((r, i) => r.rank = i + 1);
      return json(ok(res));
    }
    case "analisis-nilai": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      const mapel = P("mapel");
      const kkm = num(P("kkm")) || 75;
      if (!nip || !kelas) return fail("nip dan kelas wajib diisi");
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
      let sql = "SELECT nis, nilai FROM nilai WHERE nip=? AND kelas=?";
      const p = [nip, kelas];
      if (mapel) {
        sql += " AND mapel=?";
        p.push(mapel);
      }
      const rows = await all(db, sql, p);
      const sums = {};
      const cnts = {};
      for (const n of rows) {
        const key = s(n.nis);
        sums[key] = (sums[key] ?? 0) + num(n.nilai);
        cnts[key] = (cnts[key] ?? 0) + 1;
      }
      const students = [];
      for (const sis of siswa) {
        const key = s(sis.nis);
        if (cnts[key] && cnts[key] > 0) students.push({ nis: sis.nis, nama: sis.nama, avg: Math.round(sums[key] / cnts[key] * 10) / 10 });
      }
      if (!students.length) {
        return json(ok({ rataRata: null, tertinggi: null, terendah: null, ketuntasan: 0, kkm, remedial: [], ranking: [], distribusi: [0, 0, 0, 0, 0], labels: ["<60", "60-69", "70-79", "80-89", "90-100"], total: 0 }));
      }
      const avgs = students.map((x) => num(x.avg));
      const rata = Math.round(avgs.reduce((a, b) => a + b, 0) / avgs.length * 10) / 10;
      const tuntas = avgs.filter((a) => a >= kkm).length;
      const remedial = students.filter((x) => num(x.avg) < kkm);
      const ranking = [...students].sort((a, b) => num(b.avg) - num(a.avg));
      ranking.forEach((r, i) => r.rank = i + 1);
      const dist = [0, 0, 0, 0, 0];
      for (const a of avgs) {
        if (a < 60) dist[0]++;
        else if (a < 70) dist[1]++;
        else if (a < 80) dist[2]++;
        else if (a < 90) dist[3]++;
        else dist[4]++;
      }
      return json(ok({ rataRata: rata, tertinggi: Math.max(...avgs), terendah: Math.min(...avgs), ketuntasan: Math.round(tuntas / avgs.length * 100), kkm, remedial, ranking, distribusi: dist, labels: ["<60", "60-69", "70-79", "80-89", "90-100"], total: students.length }));
    }
    // ===================== MY DATA / ORTU =====================
    case "my-data": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      const nis = P("nis");
      if (!kelas || !nis) return fail("kelas dan nis wajib diisi");
      const dayName = hariWIB();
      const info3 = await one(db, "SELECT nis, nama_siswa AS nama, kelas, jk FROM siswa WHERE nis=?", [nis]);
      const keh = await all(db, "SELECT tanggal, status, keterangan FROM kehadiran WHERE nis=? ORDER BY tanggal DESC", [nis]);
      const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
      for (const k of keh) if (sum[s(k.status)] !== void 0) sum[s(k.status)]++;
      const ts = await all(db, "SELECT jam_ke AS jamKe, mata_pelajaran AS mapel, nip AS guru FROM jadwal_pelajaran WHERE kelas=? AND hari=? ORDER BY jam_ke", [kelas, dayName]);
      const tp = await all(db, "SELECT nis, nama_siswa AS nama FROM jadwal_piket WHERE kelas=? AND hari=?", [kelas, dayName]);
      const pg = await all(db, "SELECT id AS row, judul, isi, tanggal, penulis FROM pengumuman WHERE kelas=? ORDER BY tanggal DESC, id DESC LIMIT 3", [kelas]);
      return json(ok({ info: info3, kehadiran: keh, summary: sum, todaySchedule: ts, todayPiket: tp, pengumuman: pg, hariIni: dayName }));
    }
    case "ortu-data": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nis = P("nis");
      if (!nis) return fail("Parameter nis wajib diisi");
      const info3 = await one(db, "SELECT nis, nama_siswa AS nama, kelas, jk FROM siswa WHERE nis=?", [nis]);
      const keh = await all(db, "SELECT tanggal, status, keterangan FROM kehadiran WHERE nis=? ORDER BY tanggal DESC", [nis]);
      const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
      for (const k of keh) if (sum[s(k.status)] !== void 0) sum[s(k.status)]++;
      const nilai = await all(db, "SELECT mapel, jenis, nilai FROM nilai WHERE nis=?", [nis]);
      return json(ok({ info: info3, kehadiran: keh, summary: sum, nilai }));
    }
    // ===================== TOOLMAN =====================
    case "katalog-alat": {
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, kode, nama_barang AS nama, spesifikasi, jumlah, kondisi, lokasi FROM katalog_alat");
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO katalog_alat (kode,nama_barang,spesifikasi,jumlah,kondisi,lokasi) VALUES (?,?,?,?,?,?)", [s(body.kode), s(body.nama), s(body.spesifikasi), num(body.jumlah), s(body.kondisi), s(body.lokasi)]);
        return json(ok(null, "Alat ditambahkan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM katalog_alat WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "bahan-praktik": {
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, kode, nama_bahan AS nama, satuan, stok, stok_min AS stokMin, kategori FROM bahan_praktik");
        for (const r of rows) {
          r.stok = num(r.stok);
          r.stokMin = num(r.stokMin);
          r.lowStock = num(r.stok) <= num(r.stokMin);
        }
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO bahan_praktik (kode,nama_bahan,satuan,stok,stok_min,kategori) VALUES (?,?,?,?,?,?)", [s(body.kode), s(body.nama), s(body.satuan), num(body.stok), num(body.stokMin), s(body.kategori)]);
        return json(ok(null, "Bahan ditambahkan"));
      }
      if (method === "PUT") {
        await run(db, "UPDATE bahan_praktik SET stok=MAX(0, stok+?) WHERE kode=?", [num(body.delta), s(body.kode)]);
        const r = await one(db, "SELECT stok FROM bahan_praktik WHERE kode=?", [s(body.kode)]);
        return json(ok("Stok: " + (r ? r.stok : "?"), "Stok diperbarui"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM bahan_praktik WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "peminjaman": {
      const today = todayWIB();
      if (method === "GET") {
        const rows = await all(
          db,
          `SELECT id AS row, id_pinjam AS id, kode_barang AS kodeBarang, nama_barang AS namaBarang, peminjam,
                  jenis_peminjam AS jenisPeminjam, tgl_pinjam AS tglPinjam, batas_waktu AS batasWaktu, status, tgl_kembali AS tglKembali
           FROM peminjaman ORDER BY tgl_pinjam DESC, id DESC`
        );
        for (const r of rows) r.telat = r.status === "Dipinjam" && s(r.batasWaktu) < today;
        return json(ok(rows));
      }
      if (method === "POST") {
        const kb = s(body.kodeBarang);
        const a = await one(db, "SELECT nama_barang FROM katalog_alat WHERE kode=?", [kb]);
        if (!a) return fail("Kode alat tidak ditemukan");
        const id = "PJM" + Date.now();
        await run(db, "INSERT INTO peminjaman (id_pinjam,kode_barang,nama_barang,peminjam,jenis_peminjam,tgl_pinjam,batas_waktu,status,tgl_kembali) VALUES (?,?,?,?,?,?,?,?,?)", [id, kb, s(a.nama_barang), s(body.peminjam), s(body.jenis), today, s(body.batas), "Dipinjam", ""]);
        return json(ok({ id }, '"' + a.nama_barang + '" dipinjamkan ke ' + s(body.peminjam)));
      }
      if (method === "PUT") {
        const id = s(body.id) || P("id");
        await run(db, "UPDATE peminjaman SET status='Dikembalikan', tgl_kembali=? WHERE id=?", [today, id]);
        return json(ok(null, "Alat dikembalikan"));
      }
      return fail("Method not allowed", 405);
    }
    case "scan-peminjam": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const code = P("code");
      if (!code) return fail("Parameter code wajib diisi");
      const sRow = await one(db, "SELECT nama_siswa AS nama, kelas FROM siswa WHERE nis=?", [code]);
      if (sRow) return json(ok({ found: true, nama: sRow.nama, jenis: "Siswa", kelas: sRow.kelas }));
      const gRow = await one(db, "SELECT nama_guru AS nama FROM guru WHERE nip=?", [code]);
      if (gRow) return json(ok({ found: true, nama: gRow.nama, jenis: "Guru", kelas: "" }));
      const uRow = await one(db, "SELECT nama_lengkap AS nama, role, kelas FROM users WHERE username=?", [code]);
      if (uRow) return json(ok({ found: true, nama: uRow.nama, jenis: uRow.role, kelas: uRow.kelas }));
      return json(ok({ found: false, nama: "", jenis: "", kelas: "" }));
    }
    case "laporan-kerusakan": {
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, tanggal, kode_barang AS kodeBarang, nama_barang AS namaBarang, kerusakan, pelapor, status, jadwal_maintenance AS jadwal FROM laporan_kerusakan ORDER BY tanggal DESC, id DESC");
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO laporan_kerusakan (tanggal,kode_barang,nama_barang,kerusakan,pelapor,status,jadwal_maintenance) VALUES (?,?,?,?,?,?,?)", [todayWIB(), s(body.kode), s(body.nama), s(body.kerusakan), s(body.pelapor), "Menunggu", s(body.jadwal)]);
        return json(ok(null, "Laporan dicatat"));
      }
      if (method === "PUT") {
        const id = s(body.id) || P("id");
        await run(db, "UPDATE laporan_kerusakan SET status=? WHERE id=?", [s(body.status), id]);
        return json(ok(null, "Status diperbarui"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM laporan_kerusakan WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== USERS =====================
    case "users": {
      if (method === "GET") {
        const rows = await all(db, "SELECT id AS row, username, role, kelas, nama_lengkap AS nama, nip AS kodeGuru FROM users ORDER BY id");
        return json(ok(rows));
      }
      if (method === "POST") {
        const ck = await one(db, "SELECT id FROM users WHERE username=?", [s(body.username)]);
        if (ck) return fail("Username sudah dipakai");
        const hash = await hashPassword(s(body.password));
        const role = s(body.role);
        let planType = s(body.plan_type);
        let trialEndsAt = null;
        if (!planType && (role === "Walikelas" || role === "Guru")) {
          planType = "trial";
          trialEndsAt = fmtWIB(Date.now() + 7 * 24 * 3600 * 1e3);
        }
        if (!planType) planType = "free";
        await run(db, "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip,plan_type,trial_ends_at) VALUES (?,?,?,?,?,?,?,?)", [s(body.username), hash, role, s(body.kelas), s(body.nama), s(body.kodeGuru), planType, trialEndsAt]);
        return json(ok(null, "User " + s(body.username) + " ditambahkan (password aman)"));
      }
      if (method === "PUT") {
        const id = s(body.id) || P("id");
        if (body.password) {
          const hash = await hashPassword(s(body.password));
          await run(db, "UPDATE users SET username=?,password=?,role=?,kelas=?,nama_lengkap=?,nip=? WHERE id=?", [s(body.username), hash, s(body.role), s(body.kelas), s(body.nama), s(body.kodeGuru), id]);
        } else {
          await run(db, "UPDATE users SET username=?,role=?,kelas=?,nama_lengkap=?,nip=? WHERE id=?", [s(body.username), s(body.role), s(body.kelas), s(body.nama), s(body.kodeGuru), id]);
        }
        return json(ok(null, "User diperbarui"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM users WHERE id=?", [id]);
        return json(ok(null, "User dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "settings": {
      if (method === "GET") {
        const ta = await one(db, "SELECT setting_value FROM settings WHERE setting_key='TA_AKTIF'");
        const sm = await one(db, "SELECT setting_value FROM settings WHERE setting_key='SEMESTER'");
        return json(ok({ ta: ta ? ta.setting_value : "2025/2026", semester: sm ? sm.setting_value : "1" }));
      }
      if (method === "POST") {
        await run(db, "UPDATE settings SET setting_value=? WHERE setting_key='TA_AKTIF'", [s(body.ta)]);
        await run(db, "UPDATE settings SET setting_value=? WHERE setting_key='SEMESTER'", [s(body.semester)]);
        return json(ok(null, "TA aktif: " + s(body.ta) + " Semester " + s(body.semester)));
      }
      return fail("Method not allowed", 405);
    }
    case "log-aktivitas": {
      if (method === "GET") {
        const rows = await all(db, "SELECT substr(waktu,6,5) AS ts, username AS user, role, aksi, detail FROM log_aktivitas ORDER BY id DESC LIMIT 100");
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO log_aktivitas (waktu,username,role,aksi,detail) VALUES (?,?,?,?,?)", [nowWIB(), s(body.username), s(body.role), s(body.aksi), s(body.detail)]);
        return json(ok(null, "Log dicatat"));
      }
      return fail("Method not allowed", 405);
    }
    case "backup-dump": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const tables = ["users", "siswa", "guru", "kehadiran", "tatatertib", "kaskelas", "struktur_kelas", "inventaris", "pengumuman", "jadwal_pelajaran", "jadwal_piket", "jurnal_bimbingan", "jurnal_mengajar", "presensi_mapel", "nilai", "katalog_alat", "bahan_praktik", "peminjaman", "laporan_kerusakan", "settings", "log_aktivitas", "kunjungan_rumah", "bank_soal", "cbt_ujian", "cbt_soal", "cbt_sesi", "cbt_jawaban"];
      const dump = {};
      for (const t of tables) {
        try {
          dump[t] = await all(db, "SELECT * FROM " + t);
        } catch {
          dump[t] = [];
        }
      }
      return json(ok(dump));
    }
    case "rekap-data": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      const nis = P("nis");
      const start = P("start");
      const end = P("end");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      let sql = "SELECT nis, nama_siswa AS nama, jk FROM siswa WHERE kelas=?";
      const p = [kelas];
      if (nis) {
        sql += " AND nis=?";
        p.push(nis);
      }
      const siswa = await all(db, sql, p);
      sql = "SELECT tanggal, nis, status FROM kehadiran WHERE kelas=? AND tanggal>=? AND tanggal<=?";
      const p2 = [kelas, start, end];
      if (nis) {
        sql += " AND nis=?";
        p2.push(nis);
      }
      const raw2 = await all(db, sql, p2);
      const dates = Array.from(new Set(raw2.map((r) => s(r.tanggal)))).sort();
      const res = [];
      for (const sis of siswa) {
        const recs = {};
        const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
        for (const r of raw2) {
          if (s(r.nis) === s(sis.nis)) {
            recs[s(r.tanggal)] = s(r.status);
            const st = s(r.status);
            if (sum[st] !== void 0) sum[st]++;
          }
        }
        res.push({ nis: sis.nis, nama: sis.nama, jk: sis.jk, records: recs, summary: sum, total: sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa });
      }
      return json(ok({ students: res, dates }));
    }
    case "laporan-admin": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      const mapel = P("mapel");
      const start = P("start");
      const end = P("end");
      if (!nip || !kelas || !mapel || !start || !end) return fail("nip, kelas, mapel, start, end wajib diisi");
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
      const raw2 = await all(db, "SELECT tanggal, nis, status, updated_at FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?", [nip, kelas, mapel, start, end]);
      let revisi = 0;
      const dates = {};
      const byNis = {};
      for (const r of raw2) {
        dates[s(r.tanggal)] = true;
        if (r.updated_at) revisi++;
        const key = s(r.nis);
        if (!byNis[key]) byNis[key] = {};
        byNis[key][s(r.status)] = (byNis[key][s(r.status)] ?? 0) + 1;
      }
      const students = [];
      for (const sis of siswa) {
        const sm = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
        for (const [k, v] of Object.entries(byNis[s(sis.nis)] ?? {})) if (k in sm) sm[k] = v;
        const tot = sm.Hadir + sm.Sakit + sm.Izin + sm.Alfa + sm.Dispensasi;
        students.push({ nis: sis.nis, nama: sis.nama, summary: sm, total: tot, pct: tot ? Math.round(sm.Hadir / tot * 100) : 0 });
      }
      const jurnal = await all(db, "SELECT tanggal, jam_ke AS jamKe, materi, kegiatan, status FROM jurnal_mengajar WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=? ORDER BY tanggal, jam_ke", [nip, kelas, mapel, start, end]);
      const dts = Object.keys(dates).sort();
      return json(ok({ students, dates: dts, jurnal, revisiCount: revisi }));
    }
    case "presensi-mapel-rekap": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      const kelas = P("kelas");
      const mapel = P("mapel");
      const start = P("start");
      const end = P("end");
      if (!nip || !kelas || !mapel) return fail("nip, kelas, mapel wajib");
      const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
      let raw2;
      if (start && end) {
        raw2 = await all(db, "SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?", [nip, kelas, mapel, start, end]);
      } else {
        raw2 = await all(db, "SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=?", [nip, kelas, mapel]);
      }
      const dates = Array.from(new Set(raw2.map((r) => s(r.tanggal)))).sort();
      const res = [];
      for (const sis of siswa) {
        const recs = {};
        const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
        for (const r of raw2) {
          if (s(r.nis) === s(sis.nis)) {
            recs[s(r.tanggal)] = s(r.status);
            const st = s(r.status);
            if (sum[st] !== void 0) sum[st]++;
          }
        }
        const tot = sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa + sum.Dispensasi;
        res.push({ nis: sis.nis, nama: sis.nama, records: recs, summary: sum, total: tot });
      }
      return json(ok({ students: res, dates }));
    }
    // ===================== EXTRA: GURU DASHBOARD & FITUR GURU V2 =====================
    case "guru-dashboard": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nip = P("nip");
      if (!nip) return fail("Parameter nip wajib diisi");
      const r = {};
      r.jurnalCount = num((await one(db, "SELECT COUNT(*) AS c FROM jurnal_mengajar WHERE nip=?", [nip]))?.c);
      r.kelasDiampu = await all(db, "SELECT DISTINCT kelas FROM jadwal_pelajaran WHERE nip=?", [nip]);
      r.mapelList = await all(db, "SELECT DISTINCT mapel FROM presensi_mapel WHERE nip=?", [nip]);
      return json(ok(r));
    }
    case "guru-profil": {
      if (method === "GET") {
        const nip = P("nip");
        if (!nip) return fail("Parameter nip wajib diisi");
        const g = await one(db, "SELECT nip, nama_guru AS nama, mapel, kelas_diampu AS kelasDiampu FROM guru WHERE nip=?", [nip]);
        return json(ok(g ?? {}));
      }
      if (method === "POST") {
        const g = await one(db, "SELECT id FROM guru WHERE nip=?", [s(body.nip)]);
        if (g) await run(db, "UPDATE guru SET nama_guru=?, mapel=?, kelas_diampu=? WHERE nip=?", [s(body.nama), s(body.mapel), s(body.kelasDiampu), s(body.nip)]);
        else await run(db, "INSERT INTO guru (nip,nama_guru,mapel,kelas_diampu) VALUES (?,?,?,?)", [s(body.nip), s(body.nama), s(body.mapel), s(body.kelasDiampu)]);
        return json(ok(null, "Profil guru disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    case "materi": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, nip, judul, isi, tanggal, kelas, mapel FROM materi WHERE (?='' OR nip=?) ORDER BY id DESC", [nip, nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO materi (nip,judul,isi,tanggal,kelas,mapel) VALUES (?,?,?,?,?,?)", [s(body.nip), s(body.judul), s(body.isi), todayWIB(), s(body.kelas), s(body.mapel)]);
        return json(ok(null, "Materi disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM materi WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "modul-ajar": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, nip, judul, isi, tanggal FROM modul_ajar WHERE nip=? ORDER BY id DESC", [nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO modul_ajar (nip,judul,isi,tanggal) VALUES (?,?,?,?)", [s(body.nip), s(body.judul), s(body.isi), todayWIB()]);
        return json(ok(null, "Modul Ajar disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM modul_ajar WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "tugas": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, mapel, judul, deskripsi, tenggat, status, kelas FROM tugas WHERE nip=? ORDER BY id DESC", [nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO tugas (nip,mapel,judul,deskripsi,tenggat,status,kelas) VALUES (?,?,?,?,?,?,?)", [s(body.nip), s(body.mapel), s(body.judul), s(body.deskripsi), s(body.tenggat), s(body.status) || "Belum", s(body.kelas)]);
        return json(ok(null, "Tugas disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM tugas WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "pengumpulan": {
      if (method === "GET") {
        const tugasId = P("tugasId");
        const rows = await all(db, "SELECT id AS row, tugas_id AS tugasId, nis, nama_siswa AS nama, jawaban, file_url AS fileUrl, nilai, feedback, tanggal FROM pengumpulan WHERE tugas_id=?", [tugasId]);
        return json(ok(rows));
      }
      if (method === "PUT") {
        const id = s(body.id);
        await run(db, "UPDATE pengumpulan SET nilai=?, feedback=? WHERE id=?", [num(body.nilai), s(body.feedback), id]);
        return json(ok(null, "Nilai pengumpulan disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    case "catatan-perilaku": {
      if (method === "GET") {
        const nip = P("nip");
        const kelas = P("kelas");
        let rows;
        if (kelas) rows = await all(db, "SELECT id AS row, nis, nama_siswa AS nama, tanggal, kategori, catatan, tindak_lanjut AS tindakLanjut FROM catatan_perilaku WHERE nip=? AND kelas=? ORDER BY id DESC", [nip, kelas]);
        else rows = await all(db, "SELECT id AS row, nis, nama_siswa AS nama, tanggal, kategori, catatan, tindak_lanjut AS tindakLanjut FROM catatan_perilaku WHERE nip=? ORDER BY id DESC", [nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO catatan_perilaku (nip,nis,nama_siswa,kelas,tanggal,kategori,catatan,tindak_lanjut) VALUES (?,?,?,?,?,?,?,?)", [s(body.nip), s(body.nis), s(body.nama), s(body.kelas), todayWIB(), s(body.kategori), s(body.catatan), s(body.tindakLanjut)]);
        return json(ok(null, "Catatan perilaku disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM catatan_perilaku WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "portofolio": {
      if (method === "GET") {
        const nip = P("nip");
        const nis = P("nis");
        let rows;
        if (nis) rows = await all(db, "SELECT id AS row, nis, judul, deskripsi, tanggal FROM portofolio WHERE nip=? AND nis=? ORDER BY id DESC", [nip, nis]);
        else rows = await all(db, "SELECT id AS row, nis, judul, deskripsi, tanggal FROM portofolio WHERE nip=? ORDER BY id DESC", [nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO portofolio (nip,nis,judul,deskripsi,tanggal) VALUES (?,?,?,?,?)", [s(body.nip), s(body.nis), s(body.judul), s(body.deskripsi), todayWIB()]);
        return json(ok(null, "Portofolio disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM portofolio WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "rubrik": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, nip, nama, komponen, tanggal FROM rubrik WHERE (?='' OR nip=?) ORDER BY id DESC", [nip, nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO rubrik (nip,nama,komponen,tanggal) VALUES (?,?,?,?)", [s(body.nip), s(body.nama), s(body.komponen), todayWIB()]);
        return json(ok(null, "Rubrik disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM rubrik WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "agenda": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, nip, judul, tanggal, jam, catatan FROM agenda WHERE (?='' OR nip=?) ORDER BY tanggal DESC, id DESC", [nip, nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO agenda (nip,judul,tanggal,jam,catatan) VALUES (?,?,?,?,?)", [s(body.nip), s(body.judul), s(body.tanggal), s(body.jam), s(body.catatan)]);
        return json(ok(null, "Agenda disimpan"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM agenda WHERE id=?", [id]);
        return json(ok(null, "Dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "presensi-guru": {
      if (method === "GET") {
        const nip = P("nip");
        const rows = await all(db, "SELECT id AS row, nip, tanggal, status, keterangan FROM presensi_guru WHERE (?='' OR nip=?) ORDER BY tanggal DESC, id DESC", [nip, nip]);
        return json(ok(rows));
      }
      if (method === "POST") {
        await run(db, "INSERT INTO presensi_guru (nip,tanggal,status,keterangan) VALUES (?,?,?,?)", [s(body.nip), s(body.tanggal) || todayWIB(), s(body.status), s(body.keterangan)]);
        return json(ok(null, "Presensi guru disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== CBT SETUP =====================
    case "setup-cbt": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const ddl = [
        `CREATE TABLE IF NOT EXISTS bank_soal (id INTEGER PRIMARY KEY AUTOINCREMENT, nip TEXT, mapel TEXT, kelas TEXT DEFAULT '', jenis INTEGER, soal TEXT, opsi TEXT, kunci TEXT, pembahasan TEXT, bobot INTEGER DEFAULT 1, tanggal TEXT)`,
        `CREATE TABLE IF NOT EXISTS cbt_ujian (id INTEGER PRIMARY KEY AUTOINCREMENT, nip TEXT, judul TEXT, kelas TEXT, mapel TEXT, durasi_menit INTEGER DEFAULT 60, token TEXT, aktif INTEGER DEFAULT 1, tanggal TEXT, ai_aktif INTEGER DEFAULT 0)`,
        `CREATE TABLE IF NOT EXISTS cbt_soal (id INTEGER PRIMARY KEY AUTOINCREMENT, ujian_id INTEGER, no_urut INTEGER, jenis INTEGER, soal TEXT, opsi TEXT, kunci TEXT, pembahasan TEXT, bobot INTEGER DEFAULT 1)`,
        `CREATE TABLE IF NOT EXISTS cbt_sesi (id INTEGER PRIMARY KEY AUTOINCREMENT, ujian_id INTEGER, nis TEXT, nama TEXT, mulai TEXT, deadline TEXT, selesai INTEGER DEFAULT 0, skor REAL, total_benar INTEGER DEFAULT 0, total_soal INTEGER DEFAULT 0, uraian_menunggu INTEGER DEFAULT 0)`,
        `CREATE TABLE IF NOT EXISTS cbt_jawaban (id INTEGER PRIMARY KEY AUTOINCREMENT, sesi_id INTEGER, soal_id INTEGER, jawaban TEXT, benar INTEGER, feedback TEXT, sumber TEXT DEFAULT 'manual', UNIQUE(sesi_id,soal_id))`
      ];
      let okCount = 0;
      const errs = [];
      for (const sql of ddl) {
        try {
          await run(db, sql);
          okCount++;
        } catch (e) {
          errs.push(String(e instanceof Error ? e.message : e));
        }
      }
      return json(ok({ ok: okCount, errors: errs }, "Setup CBT selesai"));
    }
    case "setup-banksoal": {
      const okCount = [];
      const errs = [];
      try {
        await run(db, "DROP TABLE IF EXISTS bank_soal");
        await run(db, "CREATE TABLE bank_soal (id INTEGER PRIMARY KEY AUTOINCREMENT, nip TEXT NOT NULL, mapel TEXT, kelas TEXT DEFAULT '', jenis INTEGER DEFAULT 1, soal TEXT, opsi TEXT, kunci TEXT, pembahasan TEXT, bobot INTEGER DEFAULT 1, tanggal TEXT)");
        okCount.push(1);
      } catch (e) {
        errs.push(String(e instanceof Error ? e.message : e));
      }
      return json(ok({ ok: okCount.length, errors: errs }, "Bank Soal siap"));
    }
    // ===================== BANK SOAL =====================
    case "bank-soal":
    case "bank-soal-cbt": {
      if (method === "GET") {
        const nip = P("nip");
        if (!nip) return fail("nip wajib");
        const mapel = P("mapel");
        const kelas = P("kelas");
        const rows = await all(db, "SELECT id AS row, nip, mapel, kelas, jenis, soal, opsi, kunci, pembahasan, bobot, tanggal FROM bank_soal WHERE nip=? AND (mapel=? OR ?='') AND (kelas=? OR ?='') ORDER BY id DESC", [nip, mapel, mapel, kelas, kelas]);
        for (const r of rows) {
          r.opsiArr = JSON.parse(s(r.opsi) || "[]") || [];
          r.kunciArr = num(r.jenis) === 3 ? JSON.parse(s(r.kunci) || "[]") || [] : null;
        }
        return json(ok(rows));
      }
      if (method === "POST") {
        const nip = s(body.nip);
        const mapel = s(body.mapel);
        const kelas = s(body.kelas);
        if (!nip) return fail("nip wajib");
        let soal = Array.isArray(body.soal) ? body.soal : [];
        if (!soal.length) {
          if (body.pertanyaan !== void 0 || body.soal_text !== void 0) soal = [body];
          else return fail("Tidak ada soal untuk disimpan");
        }
        let n = 0;
        for (const sItem of soal) {
          let jenis = num(sItem.jenis ?? 1);
          if (typeof sItem.jenis === "string") {
            const jenisMap = { "PG": 1, "Essay": 5, "Benar/Salah": 1, "Isian": 4 };
            jenis = jenisMap[sItem.jenis] ?? 1;
          }
          const opsi = Array.isArray(sItem.opsi) ? sItem.opsi : [];
          let kunci = sItem.kunci ?? "";
          if (Array.isArray(kunci)) kunci = JSON.stringify(kunci);
          const teksSoal = sItem.soal ?? sItem.pertanyaan ?? sItem.soal_text ?? "";
          const mapelItem = sItem.mapel ?? mapel;
          const kelasItem = sItem.kelas ?? kelas;
          await run(db, "INSERT INTO bank_soal (nip,mapel,kelas,jenis,soal,opsi,kunci,pembahasan,bobot,tanggal) VALUES (?,?,?,?,?,?,?,?,?,?)", [nip, mapelItem, kelasItem, jenis, teksSoal, JSON.stringify(opsi), String(kunci), s(sItem.pembahasan), num(sItem.bobot) || 1, todayWIB()]);
          n++;
        }
        return json(ok({ inserted: n }, n + " soal tersimpan ke bank"));
      }
      if (method === "DELETE") {
        let ids = body.ids;
        if ((ids === null || ids === "") && P("ids")) ids = P("ids").split(",");
        if (Array.isArray(ids) && ids.length) {
          const idsArr = ids.map((x) => num(x));
          for (const id2 of idsArr) await run(db, "DELETE FROM bank_soal WHERE id=?", [id2]);
          return json(ok(null, idsArr.length + " soal dihapus dari bank"));
        }
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM bank_soal WHERE id=?", [id]);
        return json(ok(null, "Soal dihapus dari bank"));
      }
      return fail("Method not allowed", 405);
    }
    // ===================== CBT: GURU =====================
    case "cbt-exam": {
      if (method === "GET") {
        const nip = P("nip");
        if (!nip) return fail("nip wajib");
        const rows = await all(
          db,
          `SELECT u.id AS row, u.judul, u.kelas, u.mapel, u.durasi_menit AS durasi, u.token, u.aktif, COALESCE(u.ai_aktif,0) AS ai_aktif, u.tanggal,
                  (SELECT COUNT(*) FROM cbt_soal WHERE ujian_id=u.id) AS jmlSoal,
                  (SELECT COUNT(*) FROM cbt_soal WHERE ujian_id=u.id AND jenis=1) AS jmlPG,
                  (SELECT COUNT(*) FROM cbt_soal WHERE ujian_id=u.id AND jenis=5) AS jmlEssay,
                  (SELECT COUNT(DISTINCT nis) FROM cbt_sesi WHERE ujian_id=u.id) AS peserta,
                  (SELECT AVG(skor) FROM cbt_sesi WHERE ujian_id=u.id AND selesai=1) AS rata
           FROM cbt_ujian u WHERE u.nip=? ORDER BY u.id DESC`,
          [nip]
        );
        for (const r of rows) {
          r.status = num(r.aktif) ? "Aktif" : "Selesai";
          if (r.rata !== null && r.rata !== void 0) r.rata = Math.round(num(r.rata) * 10) / 10;
        }
        return json(ok(rows));
      }
      if (method === "POST") {
        const nip = s(body.nip);
        const kelas = s(body.kelas);
        const mapel = s(body.mapel);
        const judul = s(body.judul) || "Ulangan";
        let dur = num(body.durasi) || 30;
        if (dur < 1) dur = 30;
        const ai = body.ai ? 1 : 0;
        const token = randomToken(6);
        const uid = await insertId(db, "INSERT INTO cbt_ujian (nip,judul,kelas,mapel,durasi_menit,token,aktif,ai_aktif,tanggal) VALUES (?,?,?,?,?,?,1,?,?)", [nip, judul, kelas, mapel, dur, token, ai, todayWIB()]);
        if (Array.isArray(body.soalIds) && body.soalIds.length) {
          for (const sid of body.soalIds) {
            const sRow = await one(db, "SELECT jenis, soal, opsi, kunci, pembahasan, bobot FROM bank_soal WHERE id=?", [sid]);
            if (sRow) {
              const maxNo = await one(db, "SELECT COALESCE(MAX(no_urut),0) AS m FROM cbt_soal WHERE ujian_id=?", [uid]);
              await run(db, "INSERT INTO cbt_soal (ujian_id,no_urut,jenis,soal,opsi,kunci,pembahasan,bobot) VALUES (?,?,?,?,?,?,?,?)", [uid, num(maxNo?.m) + 1, num(sRow.jenis), sRow.soal, sRow.opsi, sRow.kunci, sRow.pembahasan, num(sRow.bobot) || 1]);
            }
          }
        }
        return json(ok({ id: uid, token }, "Ujian dibuat. Token: " + token));
      }
      if (method === "PUT") {
        const id = num(body.id);
        const status = s(body.status) || "Aktif";
        const aktif = status === "Aktif" ? 1 : 0;
        await run(db, "UPDATE cbt_ujian SET aktif=? WHERE id=?", [aktif, id]);
        return json(ok(null, "Status ujian diperbarui"));
      }
      if (method === "DELETE") {
        const id = P("id") || s(body.id);
        await run(db, "DELETE FROM cbt_jawaban WHERE sesi_id IN (SELECT id FROM cbt_sesi WHERE ujian_id=?)", [id]);
        await run(db, "DELETE FROM cbt_sesi WHERE ujian_id=?", [id]);
        await run(db, "DELETE FROM cbt_soal WHERE ujian_id=?", [id]);
        await run(db, "DELETE FROM cbt_ujian WHERE id=?", [id]);
        return json(ok(null, "Ujian dihapus"));
      }
      return fail("Method not allowed", 405);
    }
    case "cbt-get-ujian": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const id = P("id");
      if (!id) return fail("id wajib");
      const u = await one(db, "SELECT * FROM cbt_ujian WHERE id=?", [id]);
      if (!u) return fail("Ujian tidak ditemukan");
      u.soal = await all(db, "SELECT * FROM cbt_soal WHERE ujian_id=? ORDER BY no_urut", [id]);
      return json(ok(u));
    }
    case "cbt-hasil-guru": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const id = P("id");
      if (!id) return fail("id wajib");
      const rows = await all(db, "SELECT s.id AS sesiId, s.nis, s.nama, s.skor, s.total_benar AS benar, s.total_soal AS total, s.uraian_menunggu AS uraian, s.selesai, s.mulai FROM cbt_sesi s WHERE s.ujian_id=? ORDER BY s.selesai DESC, s.skor DESC", [id]);
      return json(ok(rows));
    }
    // ===================== CBT: SISWA =====================
    case "cbt-mulai": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const token = s(body.token).trim().toUpperCase();
      const nis = s(body.nis);
      const nama = s(body.nama);
      const kelas = s(body.kelas);
      if (!token || !nis) return fail("Token dan NIS wajib");
      const u = await one(db, "SELECT id, judul, mapel, durasi_menit AS durasi, kelas, COALESCE(ai_aktif,0) AS ai_aktif FROM cbt_ujian WHERE token=? AND aktif=1", [token]);
      if (!u) return fail("Token tidak valid atau ujian sudah ditutup");
      if (kelas && u.kelas && u.kelas !== kelas) return fail("Ujian ini untuk kelas " + u.kelas);
      const uid = num(u.id);
      const dur = num(u.durasi);
      const sesi = await one(db, "SELECT id, deadline, selesai, skor FROM cbt_sesi WHERE ujian_id=? AND nis=? LIMIT 1", [uid, nis]);
      if (sesi && num(sesi.selesai) === 1) {
        return json(ok({ sudah: true, total: sesi.skor }));
      }
      let sid;
      let sisaDetik;
      if (!sesi) {
        sid = await insertId(db, "INSERT INTO cbt_sesi (ujian_id,nis,nama,mulai,deadline,selesai) VALUES (?,?,?,?,?,0)", [uid, nis, nama, nowWIB(), addMinutesWib(nowWIB(), dur)]);
        sisaDetik = dur * 60;
      } else {
        sid = num(sesi.id);
        sisaDetik = Math.max(0, Math.floor((wibToEpoch(s(sesi.deadline)) - Date.now()) / 1e3));
      }
      const soal = await all(db, "SELECT id, id AS soalId, no_urut AS no, jenis, soal AS pertanyaan, opsi, pembahasan, bobot FROM cbt_soal WHERE ujian_id=? ORDER BY no_urut", [uid]);
      for (const r of soal) {
        r.opsiArr = JSON.parse(s(r.opsi) || "[]") || [];
        delete r.opsi;
        r.jenis = num(r.jenis) === 5 ? "Essay" : "PG";
      }
      const savedRows = await all(db, "SELECT soal_id, jawaban FROM cbt_jawaban WHERE sesi_id=?", [sid]);
      const saved = {};
      for (const x of savedRows) saved[s(x.soal_id)] = s(x.jawaban);
      return json(ok({ sesiId: sid, sisaDetik, judul: u.judul, mapel: u.mapel, ai: num(u.ai_aktif), soal, saved }));
    }
    case "cbt-simpan-jawaban": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const sesiId = num(body.sesiId);
      const soalId = num(body.soalId);
      const jw = body.jawaban ?? "";
      if (!sesiId || !soalId) return fail("sesiId & soalId wajib");
      const ex = await one(db, "SELECT id FROM cbt_jawaban WHERE sesi_id=? AND soal_id=?", [sesiId, soalId]);
      if (ex) await run(db, "UPDATE cbt_jawaban SET jawaban=? WHERE sesi_id=? AND soal_id=?", [jw, sesiId, soalId]);
      else await run(db, "INSERT INTO cbt_jawaban (sesi_id,soal_id,jawaban) VALUES (?,?,?)", [sesiId, soalId, jw]);
      return json(ok(null, "ok"));
    }
    case "cbt-simpan-batch": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const sesiId = num(body.sesiId);
      const arr = Array.isArray(body.jawaban) ? body.jawaban : [];
      if (!sesiId) return fail("sesiId wajib");
      for (const x of arr) {
        const soalId = num(x.soalId);
        if (!soalId) continue;
        const jw = x.jawaban ?? "";
        const ex = await one(db, "SELECT id FROM cbt_jawaban WHERE sesi_id=? AND soal_id=?", [sesiId, soalId]);
        if (ex) await run(db, "UPDATE cbt_jawaban SET jawaban=? WHERE sesi_id=? AND soal_id=?", [jw, sesiId, soalId]);
        else await run(db, "INSERT INTO cbt_jawaban (sesi_id,soal_id,jawaban) VALUES (?,?,?)", [sesiId, soalId, jw]);
      }
      return json(ok(null, "batch tersimpan"));
    }
    case "cbt-kumpulkan": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const sesiId = num(body.sesiId);
      if (!sesiId) return fail("sesiId wajib");
      const result = await finalizeSesi(db, sesiId, false);
      return json(ok(result, "Kumpulkan selesai"));
    }
    case "cbt-cleanup-expired": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const expired = await all(db, "SELECT id FROM cbt_sesi WHERE selesai=0 AND deadline < datetime('now','+7 hours')");
      let count3 = 0;
      for (const row of expired) {
        await finalizeSesi(db, num(row.id), false);
        count3++;
      }
      return json(ok({ finalized: count3 }, count3 + " sesi difinalisasi otomatis"));
    }
    case "cbt-hasil": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const examId = P("examId");
      if (!examId) return fail("examId wajib");
      const rows = await all(
        db,
        `SELECT s.nis, s.nama, s.skor AS total, s.selesai, s.uraian_menunggu,
                (SELECT COALESCE(SUM(j.benar),0) FROM cbt_jawaban j JOIN cbt_soal q ON q.id=j.soal_id WHERE j.sesi_id=s.id AND q.jenis!=5) AS pgPoin,
                (SELECT COALESCE(SUM(q.bobot),0) FROM cbt_soal q WHERE q.ujian_id=s.ujian_id AND q.jenis!=5) AS pgTotal,
                (SELECT COALESCE(SUM(j.benar),0) FROM cbt_jawaban j JOIN cbt_soal q ON q.id=j.soal_id WHERE j.sesi_id=s.id AND q.jenis=5) AS esPoin,
                (SELECT COALESCE(SUM(q.bobot),0) FROM cbt_soal q WHERE q.ujian_id=s.ujian_id AND q.jenis=5) AS esTotal
         FROM cbt_sesi s WHERE s.ujian_id=? ORDER BY s.selesai DESC, s.skor DESC`,
        [examId]
      );
      for (const r of rows) {
        r.status = num(r.selesai) ? "Selesai" : "Berlangsung";
        const pgPoin = num(r.pgPoin);
        const pgTotal = num(r.pgTotal);
        const esPoin = num(r.esPoin);
        const esTotal = num(r.esTotal);
        r.nilaiPg = pgTotal > 0 ? Math.round(pgPoin / pgTotal * 100 * 100) / 100 : null;
        if (num(r.selesai) === 1 && esTotal > 0 && num(r.uraian_menunggu) === 0) {
          r.nilaiEssay = Math.round(esPoin / esTotal * 100 * 100) / 100;
          r.total = pgTotal + esTotal > 0 ? Math.round((pgPoin + esPoin) / (pgTotal + esTotal) * 100 * 100) / 100 : r.total;
        } else {
          r.nilaiEssay = null;
          r.total = r.nilaiPg;
        }
      }
      return json(ok(rows));
    }
    case "cbt-essay": {
      if (method === "GET") {
        const examId = P("examId");
        if (!examId) return fail("examId wajib");
        const rows = await all(
          db,
          `SELECT j.id, j.jawaban, j.benar AS nilai, j.feedback, j.sumber, j.sesi_id AS sesiId, j.soal_id AS soalId,
                  s.nis, s.nama, q.soal AS pertanyaan, q.kunci, q.bobot
           FROM cbt_jawaban j JOIN cbt_sesi s ON s.id=j.sesi_id JOIN cbt_soal q ON q.id=j.soal_id
           WHERE s.ujian_id=? AND q.jenis=5 ORDER BY s.nama`,
          [examId]
        );
        for (const r of rows) r.status = r.nilai !== null && r.nilai !== void 0 ? "dinilai" : "pending";
        return json(ok(rows));
      }
      if (method === "PUT") {
        const id = num(body.id);
        const nilai = num(body.nilai);
        const feedback = body.feedback ?? null;
        const sumber = s(body.sumber) || "manual";
        if (feedback !== null) await run(db, "UPDATE cbt_jawaban SET benar=?, feedback=?, sumber=? WHERE id=?", [nilai, feedback, sumber, id]);
        else await run(db, "UPDATE cbt_jawaban SET benar=?, sumber=? WHERE id=?", [nilai, sumber, id]);
        const row = await one(db, "SELECT sesi_id FROM cbt_jawaban WHERE id=?", [id]);
        if (row) await finalizeSesi(db, num(row.sesi_id), true);
        return json(ok(null, "Nilai essay disimpan"));
      }
      return fail("Method not allowed", 405);
    }
    case "cbt-essay-detail": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const id = P("id");
      if (!id) return fail("id wajib");
      const row = await one(
        db,
        `SELECT j.jawaban, j.benar AS nilai, j.feedback, j.sumber, j.sesi_id AS sesiId, j.soal_id AS soalId,
                q.soal AS pertanyaan, q.kunci, q.bobot
         FROM cbt_jawaban j JOIN cbt_soal q ON q.id=j.soal_id WHERE j.id=?`,
        [id]
      );
      if (!row) return fail("Jawaban tidak ditemukan");
      row.status = row.nilai !== null && row.nilai !== void 0 ? "dinilai" : "pending";
      return json(ok(row));
    }
    case "cbt-ai-toggle": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const id = num(body.id);
      const ai = body.ai ? 1 : 0;
      if (!id) return fail("id wajib");
      await run(db, "UPDATE cbt_ujian SET ai_aktif=? WHERE id=?", [ai, id]);
      return json(ok(null, "Koreksi AI " + (ai ? "diaktifkan" : "dinonaktifkan")));
    }
    case "cbt-riwayat-siswa": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const nis = P("nis");
      if (!nis) return fail("nis wajib");
      const rows = await all(db, "SELECT u.judul, u.mapel, u.kelas, s.skor AS total, u.tanggal FROM cbt_sesi s JOIN cbt_ujian u ON u.id=s.ujian_id WHERE s.nis=? AND s.selesai=1 ORDER BY s.id DESC", [nis]);
      return json(ok(rows));
    }
    // ===================== AI FEATURES =====================
    case "ai-data-summary": {
      if (method !== "GET") return fail("Method not allowed", 405);
      const kelas = P("kelas");
      const type = P("type") || "dashboard";
      const from = P("date_from");
      const to = P("date_to");
      if (!kelas) return fail("Parameter kelas wajib diisi");
      const data = { type, kelas, periode: (from || "semua") + " s/d " + (to || "sekarang") };
      switch (type) {
        case "tugas": {
          let where = "kelas = ?";
          const params = [kelas];
          if (from) {
            where += " AND tanggal >= ?";
            params.push(from);
          }
          if (to) {
            where += " AND tanggal <= ?";
            params.push(to);
          }
          data.records = await all(db, "SELECT id, mapel, judul, deskripsi, tenggat, status FROM tugas WHERE " + where + " ORDER BY tenggat DESC LIMIT 50", params);
          break;
        }
        case "presensi":
          data.records = await all(db, "SELECT tanggal, status, COUNT(*) AS c FROM kehadiran WHERE kelas=? GROUP BY tanggal, status ORDER BY tanggal DESC LIMIT 50", [kelas]);
          break;
        case "nilai":
          data.records = await all(db, "SELECT nis, nama_siswa AS nama, mapel, AVG(nilai) AS rata, COUNT(*) AS total FROM nilai WHERE kelas=? GROUP BY nis, mapel ORDER BY mapel LIMIT 50", [kelas]);
          break;
        case "jurnal":
          data.records = await all(db, "SELECT tanggal, mapel, materi, kegiatan FROM jurnal_mengajar WHERE kelas=? ORDER BY tanggal DESC LIMIT 50", [kelas]);
          break;
        case "pengumuman":
          data.records = await all(db, "SELECT judul, isi, tanggal, penulis FROM pengumuman WHERE kelas=? ORDER BY tanggal DESC LIMIT 50", [kelas]);
          break;
        default: {
          const today = todayWIB();
          data.total_siswa = num((await one(db, "SELECT COUNT(*) AS c FROM siswa WHERE kelas=?", [kelas]))?.c);
          const pres = await all(db, "SELECT status, COUNT(*) AS c FROM kehadiran WHERE kelas=? AND tanggal=? GROUP BY status", [kelas, today]);
          const p = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
          for (const r of pres) {
            const st = s(r.status);
            if (st in p) p[st] = num(r.c);
          }
          data.presensi_hari_ini = p;
          data.total_pelanggaran = num((await one(db, "SELECT COUNT(*) AS c FROM tatatertib WHERE kelas=?", [kelas]))?.c);
          const kas = await one(db, "SELECT COALESCE(SUM(CASE WHEN jenis='Masuk' THEN jumlah ELSE 0 END),0) AS m, COALESCE(SUM(CASE WHEN jenis='Keluar' THEN jumlah ELSE 0 END),0) AS k FROM kaskelas WHERE kelas=?", [kelas]);
          data.kas_saldo = num(kas?.m) - num(kas?.k);
          break;
        }
      }
      return json(ok(data));
    }
    case "ai-search-filter": {
      if (method !== "POST") return fail("Method not allowed", 405);
      const kelas = s(body.kelas) || P("kelas");
      const table3 = s(body.table);
      const filters = Array.isArray(body.filters) ? body.filters : [];
      let limit = num(body.limit) || 100;
      let offset = num(body.offset) || 0;
      if (!kelas) return fail("Parameter kelas wajib diisi");
      if (!table3) return fail("Parameter table wajib diisi");
      const allowedTables = ["kehadiran", "nilai", "tatatertib", "jurnal_mengajar", "jurnal_bimbingan", "siswa", "katalog_alat", "bahan_praktik", "peminjaman", "kaskelas", "pengumuman", "kunjungan_rumah", "presensi_mapel", "tugas"];
      if (!allowedTables.includes(table3)) return fail("Table tidak diizinkan: " + table3, 400);
      const allowedFields = {
        kehadiran: ["tanggal", "nis", "status", "keterangan"],
        nilai: ["nis", "mapel", "jenis", "nilai", "tanggal"],
        tatatertib: ["tanggal", "nis", "pelanggaran", "poin"],
        jurnal_mengajar: ["tanggal", "nip", "mapel", "jam_ke", "materi", "kegiatan"],
        jurnal_bimbingan: ["tanggal", "nis", "kategori", "isi", "tindak_lanjut"],
        siswa: ["nis", "nama_siswa", "jk", "ttl", "alamat", "no_wa", "ekstra"],
        katalog_alat: ["kode", "nama_barang", "spesifikasi", "jumlah", "kondisi", "lokasi"],
        bahan_praktik: ["kode", "nama_bahan", "satuan", "stok", "stok_min", "kategori"],
        peminjaman: ["id_pinjam", "kode_barang", "nama_barang", "peminjam", "jenis_peminjam", "tgl_pinjam", "batas_waktu", "status", "tgl_kembali"],
        kaskelas: ["tanggal", "jenis", "jumlah", "keterangan"],
        pengumuman: ["judul", "isi", "tanggal", "penulis"],
        kunjungan_rumah: ["tanggal", "nis", "nama_siswa", "alamat", "hasil", "tindak_lanjut", "petugas"],
        presensi_mapel: ["tanggal", "nis", "nip", "mapel", "status", "jam_ke"],
        tugas: ["id", "mapel", "judul", "deskripsi", "tenggat", "status"]
      };
      const tableFields = allowedFields[table3] ?? [];
      const opMap = { eq: "=", neq: "!=", gt: ">", gte: ">=", lt: "<", lte: "<=", like: "LIKE", not_like: "NOT LIKE", in: "IN", not_in: "NOT IN", between: "BETWEEN" };
      const whereParts = ["kelas = ?"];
      const params = [kelas];
      for (const f of filters) {
        const field = s(f.field);
        const op = s(f.operator) || "eq";
        const val = f.value;
        if (!field || !tableFields.includes(field)) continue;
        const sqlOp = opMap[op] ?? "=";
        if (op === "between" && Array.isArray(val) && val.length === 2) {
          whereParts.push(`${field} ${sqlOp} ? AND ?`);
          params.push(val[0], val[1]);
        } else if ((op === "in" || op === "not_in") && Array.isArray(val)) {
          whereParts.push(`${field} ${sqlOp} (${val.map(() => "?").join(",")})`);
          params.push(...val);
        } else if (op === "like" || op === "not_like") {
          whereParts.push(`${field} ${sqlOp} ?`);
          params.push("%" + s(val) + "%");
        } else {
          whereParts.push(`${field} ${sqlOp} ?`);
          params.push(val ?? "");
        }
      }
      const whereSql = whereParts.join(" AND ");
      const total = num((await one(db, `SELECT COUNT(*) AS c FROM ${table3} WHERE ${whereSql}`, params))?.c);
      params.push(limit, offset);
      const records = await all(db, `SELECT * FROM ${table3} WHERE ${whereSql} ORDER BY id DESC LIMIT ? OFFSET ?`, params);
      return json(ok({ records, total, limit, offset, table: table3 }));
    }
    default:
      return fail("Action tidak valid: " + action, 400);
  }
}
__name(dispatch, "dispatch");
async function finalizeSesi(db, sid, recalc) {
  const sSesi = await one(db, "SELECT selesai, ujian_id, deadline FROM cbt_sesi WHERE id=?", [sid]);
  if (!sSesi) return { skor: null, benar: 0, total: 0, uraian: 0 };
  if (!recalc && num(sSesi.selesai) === 1) {
    const f = await one(db, "SELECT skor, total_benar, total_soal, uraian_menunggu FROM cbt_sesi WHERE id=?", [sid]);
    return { skor: f?.skor ?? null, benar: num(f?.total_benar), total: num(f?.total_soal), uraian: num(f?.uraian_menunggu) };
  }
  const uid = num(sSesi.ujian_id);
  const soalRows = await all(db, "SELECT id, jenis, kunci, bobot FROM cbt_soal WHERE ujian_id=?", [uid]);
  const soal = {};
  for (const r of soalRows) soal[num(r.id)] = r;
  const jwRows = await all(db, "SELECT soal_id, jawaban, benar FROM cbt_jawaban WHERE sesi_id=?", [sid]);
  const jw = {};
  const jbenar = {};
  for (const x of jwRows) {
    jw[num(x.soal_id)] = s(x.jawaban);
    jbenar[num(x.soal_id)] = x.benar !== null && x.benar !== void 0 ? num(x.benar) : null;
  }
  let pgPoin = 0, pgTotal = 0, esPoin = 0, esTotal = 0, esMenunggu = 0;
  for (const [sidKey, meta] of Object.entries(soal)) {
    const so = num(sidKey);
    const jenis = num(meta.jenis);
    const bobot = num(meta.bobot) || 1;
    const jawab = jw[so] ?? null;
    if (jenis === 5) {
      esTotal += bobot;
      if (jbenar[so] !== void 0 && jbenar[so] !== null) esPoin += jbenar[so];
      else if (jawab !== null && jawab !== "") esMenunggu++;
      continue;
    }
    pgTotal += bobot;
    let okVal = 0;
    const kunci = s(meta.kunci);
    if (jenis === 1) {
      okVal = jawab?.trim().toUpperCase() === kunci.trim().toUpperCase() ? 1 : 0;
    } else if (jenis === 2) {
      const ka = kunci.split(",").map((x) => x.trim()).filter(Boolean).sort();
      const va = (Array.isArray(jawab) ? jawab : safeJson(jawab)).sort();
      okVal = JSON.stringify(ka) === JSON.stringify(va) ? 1 : 0;
    } else if (jenis === 3) {
      const ka = safeJson(kunci);
      const va = Array.isArray(jawab) ? jawab : safeJson(jawab);
      const norm = /* @__PURE__ */ __name((a) => {
        const o = {};
        if (Array.isArray(a)) for (const p of a) if (p && p.b !== void 0 && p.k !== void 0) o[p.b] = p.k;
        else for (const k of Object.keys(a ?? {})) o[k] = a[k];
        return Object.keys(o).sort().map((k) => [k, o[k]]);
      }, "norm");
      okVal = JSON.stringify(norm(ka)) === JSON.stringify(norm(va)) ? 1 : 0;
    } else if (jenis === 4) {
      const a = (jawab || "").toLowerCase().trim();
      const k = kunci.toLowerCase().trim();
      okVal = a !== "" && k !== "" && (a === k || a.includes(k) || k.includes(a)) ? 1 : 0;
    }
    if (okVal) pgPoin += bobot;
    await run(db, "UPDATE cbt_jawaban SET benar=? WHERE sesi_id=? AND soal_id=?", [okVal, sid, so]);
  }
  let skor;
  if (pgTotal > 0 && esMenunggu === 0 && esPoin > 0) {
    const totalBobot = pgTotal + esTotal;
    skor = totalBobot > 0 ? Math.round((pgPoin + esPoin) / totalBobot * 1e4) / 100 : null;
  } else {
    skor = pgTotal > 0 ? Math.round(pgPoin / pgTotal * 1e4) / 100 : null;
  }
  await run(db, "UPDATE cbt_sesi SET selesai=1, skor=?, total_benar=?, total_soal=?, uraian_menunggu=? WHERE id=?", [skor, pgPoin, pgTotal, esMenunggu, sid]);
  return { skor, benar: pgPoin, total: pgTotal, uraian: esMenunggu };
}
__name(finalizeSesi, "finalizeSesi");
function safeJson(v) {
  try {
    return JSON.parse(s(v));
  } catch {
    return [];
  }
}
__name(safeJson, "safeJson");

// src/api-bridge.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();

// src/lib/gemini.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var GEMINI_MODEL_DEFAULT = "gemini-3.5-flash";
function geminiKey(c) {
  return (c.env.GEMINI_KEY || "").trim();
}
__name(geminiKey, "geminiKey");
function geminiModel(c) {
  return (c.env.GEMINI_MODEL || GEMINI_MODEL_DEFAULT).trim();
}
__name(geminiModel, "geminiModel");
var SAFETY = [
  { category: "HARM_CATEGORY_HARASSMENT", threshold: "BLOCK_NONE" },
  { category: "HARM_CATEGORY_HATE_SPEECH", threshold: "BLOCK_NONE" },
  { category: "HARM_CATEGORY_SEXUALLY_EXPLICIT", threshold: "BLOCK_NONE" },
  { category: "HARM_CATEGORY_DANGEROUS_CONTENT", threshold: "BLOCK_NONE" }
];
async function callGemini(c, prompt, temperature = 0.3, maxOutputTokens = 2e3) {
  const key = geminiKey(c);
  if (!key) return { ok: false, error: "Kunci Gemini belum diset. Atur secret GEMINI_KEY (npx wrangler secret put GEMINI_KEY)." };
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${geminiModel(c)}:generateContent?key=${key}`;
  try {
    const r = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        contents: [{ role: "user", parts: [{ text: prompt }] }],
        generationConfig: { temperature, maxOutputTokens },
        safetySettings: SAFETY
      })
    });
    if (!r.ok) {
      const txt = await r.text();
      return { ok: false, error: "Gemini HTTP " + r.status + ": " + txt.substring(0, 300) };
    }
    const j = await r.json();
    const out = j?.candidates?.[0]?.content?.parts?.[0]?.text ?? "";
    if (!out) return { ok: false, error: "Gemini tidak mengembalikan teks." };
    return { ok: true, text: out };
  } catch (e) {
    return { ok: false, error: "Gagal AI: " + (e instanceof Error ? e.message : String(e)) };
  }
}
__name(callGemini, "callGemini");
function extractJson(txt) {
  const t = String(txt).replace(/```json|```/g, "").trim();
  const a = t.indexOf("{");
  const b = t.lastIndexOf("}");
  if (a < 0 || b <= a) return null;
  try {
    return JSON.parse(t.substring(a, b + 1));
  } catch {
    return null;
  }
}
__name(extractJson, "extractJson");
async function geminiJSON(c, prompt, temp, maxTokens) {
  const r = await callGemini(c, prompt, temp, maxTokens);
  if (!r.ok || !r.text) return { success: false, message: r.error };
  const parsed = extractJson(r.text);
  if (parsed === null && prompt.indexOf("KELUARKAN HANYA SATU OBJEK JSON") > -1) {
    return { success: false, message: "AI tidak mengembalikan JSON valid: " + r.text.substring(0, 300) };
  }
  return { success: true, text: r.text, parsed };
}
__name(geminiJSON, "geminiJSON");
function aiSystem() {
  return "Anda adalah Ahli Kurikulum, Pakar Pendidikan, dan Guru Profesional yang sangat berpengalaman menyusun Perangkat Pembelajaran Kurikulum Merdeka berbasis Deep Learning dan Problem Based Learning (PBL). Gaya: praktis, siap pakai di kelas, bahasa Indonesia hangat dan jelas. Output TERSTRUKTUR dengan heading markdown (#, ##, ###), poin, dan tabel markdown yang rapi.";
}
__name(aiSystem, "aiSystem");
function aiBuild(jenis, c) {
  const mp = c.mapel || "[Mapel]";
  const kl = c.kelas || "[Kelas]";
  const top = c.topik || c.materi || "[Topik]";
  const kkm = c.kkm || 75;
  const tahun = (/* @__PURE__ */ new Date()).getFullYear();
  const penyusun = (c.guruNama && c.guruNama !== "-" ? c.guruNama : "[Nama Penyusun]") + " / " + tahun;
  const base = `Konteks: Mapel=${mp}; Kelas=${kl}; ` + (top ? `Topik=${top}; ` : "") + `KKM=${kkm}.`;
  switch (String(jenis || "").toLowerCase()) {
    case "modul":
      return `Bertindaklah sebagai Ahli Kurikulum. Buatkan Modul Ajar lengkap untuk Topik: "${top}" | Mapel: "${mp}" | Kelas: "${kl}".
FORMAT STRUKTUR:
## A. Identitas Modul
## B. Dimensi Profil Pelajar Pancasila
## C. Model (PBL) & Pendekatan (Deep Learning)
## D. Tujuan Pembelajaran
## E. Langkah-Langkah Pembelajaran (Sintaks PBL dalam Tabel)
## F. Asesmen & Lampiran (LKPD, Rubrik).
Gunakan format markdown yang rapi.`;
    case "atp":
      return base + " Buat ATP: urutan TP per elemen, indikator, dan estimasi JP dalam tabel.";
    case "soal":
      return base + " Buat 10 SOAL: 5 PG, 3 Essay, 2 B/S. Sertakan kunci & pembahasan.";
    case "lkpd":
      return base + " Buat LKPD: judul, tujuan, petunjuk, 3-4 aktivitas bertahap, kolom jawaban, refleksi.";
    case "rubrik":
      return base + " Buat RUBRIK 4 kriteria x 4 skor dalam tabel dg deskriptor per skor.";
    case "icebreaking":
      return base + " Berikan 5 ICE BREAKING 3-5 menit relevan materi, tanpa alat khusus.";
    case "pemantik":
      return base + " Buat 8 PERTANYAAN PEMANTIK HOTS dari konkret ke abstrak.";
    case "refleksi":
      return base + " Buat panduan REFLEKSI: 3 soal siswa, 3 catatan guru, 1 tindak lanjut.";
    case "analisisnilai":
      return base + " Analisis data: rata-rata, sebaran, siswa di bawah KKM, rekomendasi. Data: " + (c.data || "(umum)");
    case "remedial":
      return base + " Buat REMEDIAL & PENGAYAAN: kelompok siswa, materi ringkas, 3 soal remedial, 1 tugas pengayaan. KKM=" + kkm;
    case "rapor":
      return base + " Buat deskripsi rapor (2 paragraf) untuk " + (c.nama || "Ananda") + ", rata=" + (c.rata || "-") + ", catatan=" + (c.catatan || "-");
    default:
      return base + " Bantu guru: " + (c.prompt || jenis || "perangkat ajar");
  }
}
__name(aiBuild, "aiBuild");
async function aiGuru(c, jenis, ctx) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: 'Kunci Gemini belum diset. Jalankan setGeminiKey("...") di editor.' };
  const prompt = aiSystem() + "\n" + aiBuild(jenis, ctx || {});
  const r = await callGemini(c, prompt, 0.7, 4e3);
  if (!r.ok || !r.text) return { success: false, message: r.error };
  return { success: true, text: r.text };
}
__name(aiGuru, "aiGuru");
async function aiTextToSoal(c, teks, ctx) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: 'Kunci Gemini belum diset. Jalankan setGeminiKey("...") di editor.' };
  teks = String(teks || "").trim();
  if (teks.length < 20) return { success: false, message: "Teks terlalu pendek. Tempel materi/soal yang cukup." };
  ctx = ctx || {};
  const jumlah = Math.max(1, Math.min(30, parseInt(String(ctx.jumlah), 10) || 10));
  const mapel = ctx.mapel || "[Mapel]";
  const jenis = String(ctx.jenis || "PG").toLowerCase().indexOf("essay") > -1 ? "Essay" : "PG";
  const jenisInstr = jenis === "Essay" ? "soal berjenis ESSAY (uraian singkat). Setiap soal terdiri dari: pertanyaan, pedoman/kunci jawaban (ringkasan jawaban yang benar), dan pembahasan singkat." : "soal PILIHAN GANDA berkualitas. Setiap soal terdiri dari: pertanyaan, 5 opsi jawaban (A, B, C, D, E), kunci jawaban (huruf A-E saja), dan pembahasan singkat.";
  const schema = jenis === "Essay" ? '{"mapel":"' + mapel + '","soal":[{"pertanyaan":"...","kunci":"<pedoman jawaban>","pembahasan":"..."}]}' : '{"mapel":"' + mapel + '","soal":[{"pertanyaan":"...","opsiA":"...","opsiB":"...","opsiC":"...","opsiD":"...","opsiE":"...","kunci":"A","pembahasan":"..."}]}';
  const prompt = "Kamu adalah pembuat soal ujian sekolah yang berpengalaman. Di bawah ini adalah teks mentah (materi, rangkuman, atau kumpulan soal) dari guru.\n\nTUGAS: Pilah teks tsb menjadi " + jumlah + " " + jenisInstr + "\nJangan buat soal dari luar isi teks. Jika teks hanya memuat sedikit konsep, jangan memaksakan jumlah; buat sebanyak yang bisa didukung teks. Bahasa Indonesia.\n\nTEKS MENTAH:\n" + teks + "\n\nKELUARKAN HANYA SATU OBJEK JSON (tanpa markdown, tanpa teks lain) dalam format persis:\n" + schema;
  const r = await callGemini(c, prompt, 0.4, 8e3);
  if (!r.ok || !r.text) return { success: false, message: r.error };
  const parsed = extractJson(r.text);
  const list = parsed && parsed.soal;
  if (!list || !list.length) return { success: false, message: "AI tidak mengembalikan soal yang valid. Coba lagi." };
  const norm = [];
  for (const sItem of list) {
    if (!sItem || !String(sItem.pertanyaan || "").trim()) continue;
    if (jenis === "Essay") {
      norm.push({ jenis: "Essay", pertanyaan: String(sItem.pertanyaan).trim(), opsi: [], kunci: String(sItem.kunci || "").trim(), pembahasan: String(sItem.pembahasan || "").trim() });
      continue;
    }
    const opsi = [];
    for (const L of ["A", "B", "C", "D", "E"]) {
      const v = String(sItem["opsi" + L] || "").trim();
      if (v) opsi.push(L + ". " + v);
    }
    if (opsi.length < 2) continue;
    norm.push({ jenis: "PG", pertanyaan: String(sItem.pertanyaan).trim(), opsi, kunci: String(sItem.kunci || "").trim().toUpperCase(), pembahasan: String(sItem.pembahasan || "").trim() });
  }
  if (!norm.length) return { success: false, message: "Tidak ada soal valid hasil AI." };
  return { success: true, mapel: parsed.mapel || mapel, jenis, soal: norm };
}
__name(aiTextToSoal, "aiTextToSoal");
async function aiBuatSoalBank(c, ctx) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: 'Kunci Gemini belum diset. Jalankan setGeminiKey("...") di editor.' };
  ctx = ctx || {};
  const mapel = ctx.mapel || "[Mapel]";
  const topik = ctx.topik || ctx.materi || "[Topik]";
  const jumlah = Math.max(1, Math.min(30, parseInt(String(ctx.jumlah), 10) || 10));
  const jenis = ctx.jenis || "PG";
  const jenisInstr = jenis === "Essay" ? "semua soal berjenis ESSAY (uraian singkat). Setiap soal: pertanyaan, pedoman jawaban (kunci), pembahasan." : jenis === "Campuran" ? 'sebagian PG (pilihan ganda A\u2013E + kunci) dan sebagian Essay (uraian + pedoman). Tandai jenis="PG" atau "Essay".' : "semua soal PILIHAN GANDA A\u2013E. Setiap soal: pertanyaan, 5 opsi (A\u2013E), kunci (huruf A\u2013E), pembahasan singkat.";
  const prompt = "Kamu adalah pembuat soal ujian sekolah yang berpengalaman untuk Mapel: " + mapel + " (Kelas: " + (ctx.kelas || "-") + ").\n\nTUGAS: Buat " + jumlah + ' soal berkualitas bertema "' + topik + '". Jenis yang diminta: ' + jenisInstr + '\nSoal harus HOTS, sesuai kurikulum, bahasa Indonesia, dan tidak boleh mengada-ada fakta.\n\nKELUARKAN HANYA SATU OBJEK JSON (tanpa markdown, tanpa teks lain) format persis:\n{"soal":[{"jenis":"PG","pertanyaan":"...","opsi":["A. ...","B. ...","C. ...","D. ...","E. ..."],"kunci":"A","pembahasan":"...","bobot":1}]}\nUntuk jenis "Essay", gunakan: {"jenis":"Essay","pertanyaan":"...","kunci":"<pedoman jawaban>","pembahasan":"...","bobot":5} (tanpa opsi).';
  const r = await callGemini(c, prompt, 0.6, 8e3);
  if (!r.ok || !r.text) return { success: false, message: r.error };
  const parsed = extractJson(r.text);
  const list = parsed && parsed.soal;
  if (!list || !list.length) return { success: false, message: "AI tidak mengembalikan soal yang valid. Coba lagi." };
  const norm = [];
  for (const sItem of list) {
    if (!sItem || !String(sItem.pertanyaan || "").trim()) continue;
    const tipe = String(sItem.jenis || ctx.jenis || "PG").toLowerCase();
    const jn = tipe.indexOf("essay") > -1 ? "Essay" : "PG";
    if (jn === "PG") {
      let opsi = [];
      if (Array.isArray(sItem.opsi) && sItem.opsi.length) opsi = sItem.opsi;
      else {
        for (const L of ["A", "B", "C", "D", "E"]) {
          const v = String(sItem["opsi" + L] || "").trim();
          if (v) opsi.push(L + ". " + v);
        }
      }
      if (opsi.length < 2) continue;
      norm.push({ jenis: "PG", pertanyaan: String(sItem.pertanyaan).trim(), opsi, kunci: String(sItem.kunci || "").trim().toUpperCase(), pembahasan: String(sItem.pembahasan || "").trim(), bobot: Number(sItem.bobot) || 1 });
    } else {
      norm.push({ jenis: "Essay", pertanyaan: String(sItem.pertanyaan).trim(), opsi: [], kunci: String(sItem.kunci || "").trim(), pembahasan: String(sItem.pembahasan || "").trim(), bobot: Number(sItem.bobot) || 5 });
    }
  }
  if (!norm.length) return { success: false, message: "Tidak ada soal valid hasil AI." };
  return { success: true, mapel, kelas: ctx.kelas || "", soal: norm };
}
__name(aiBuatSoalBank, "aiBuatSoalBank");
async function generateSummary(c, kelas, type, dateFrom, dateTo, rawData) {
  let json4 = JSON.stringify(rawData);
  if (json4.length > 6e3) json4 = json4.substring(0, 6e3) + "\u2026(terpotong)";
  const prompt = "Kamu adalah analis data sekolah yang andal dan ringkas. Di bawah ini adalah data mentah (JSON) dari sistem wali kelas untuk kelas " + String(kelas || "-") + ', tipe "' + String(type || "dashboard") + '".\n\nTUGAS: Buatkan NARASI untuk dashboard yang berisi:\n1) Ringkasan 3 paragraf (apa yang terjadi, tren, angka penting).\n2) Bagian "Insight" berupa 3-5 poin bullet yang BERANI dan TINDAKAN LANJUT (bukan sekadar mengulang angka).\n3) Bagian "Peringatan" bila ada hal yang perlu perhatian wali kelas (kehadiran rendah, siswa di bawah KKM, stok menipis, dst).\nBahasa Indonesia, hangat, profesional, tanpa mengada-ada fakta. Output markdown rapi.\n\nDATA MENTAH:\n' + json4;
  const r = await geminiJSON(c, prompt, 0.5, 2e3);
  if (!r.success || !r.text) return { success: false, message: r.message };
  return { success: true, text: r.text };
}
__name(generateSummary, "generateSummary");
var SEARCH_SCHEMA = {
  table: "<salah satu: kehadiran|nilai|tatatertib|jurnal_mengajar|jurnal_bimbingan|siswa|katalog_alat|bahan_praktik|peminjaman|kaskelas|pengumuman|kunjungan_rumah|presensi_mapel|tugas>"
};
async function parseSearchQuery(c, teks, kelas) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: 'Kunci Gemini belum diset. Jalankan setGeminiKey("...") di editor.' };
  teks = String(teks || "").trim();
  if (teks.length < 3) return { success: false, message: "Ketik kalimat pencarian terlebih dahulu." };
  const schema = '{"table":"' + SEARCH_SCHEMA.table + '","filters":[{"field":"<kolom yang diizinkan>","operator":"<eq|neq|gt|gte|lt|lte|like|not_like|in|not_in|between>","value":"<nilai; untuk between gunakan array [dari,ke], untuk in gunakan array berisi banyak nilai>"}]}';
  const prompt = 'Kamu adalah Natural Language to SQL helper untuk aplikasi sekolah. Terjemahkan kalimat pengguna di bawah menjadi JSON PALING MIRING yang siap dipakai query. \nPANDUAN KOLOM PER TABEL:\n- kehadiran: tanggal, nis, status(Hadir/Sakit/Izin/Alfa), keterangan\n- nilai: nis, mapel, jenis, nilai, tanggal\n- tatatertib: tanggal, nis, pelanggaran, poin\n- jurnal_mengajar: tanggal, nip, mapel, jam_ke, materi, kegiatan\n- jurnal_bimbingan: tanggal, nis, kategori, isi, tindak_lanjut\n- siswa: nis, nama_siswa, jk, ttl, alamat, no_wa, ekstra\n- katalog_alat: kode, nama_barang, spesifikasi, jumlah, kondisi, lokasi\n- bahan_praktik: kode, nama_bahan, satuan, stok, stok_min, kategori\n- peminjaman: id_pinjam, kode_barang, nama_barang, peminjam, jenis_peminjam, tgl_pinjam, batas_waktu, status, tgl_kembali\n- kaskelas: tanggal, jenis, jumlah, keterangan\n- pengumuman: judul, isi, tanggal, penulis\n- kunjungan_rumah: tanggal, nis, nama_siswa, alamat, hasil, tindak_lanjut, petugas\n- presensi_mapel: tanggal, nis, nip, mapel, status, jam_ke\n- tugas: id, mapel, judul, deskripsi, tenggat, status\nATURAN:\n1. Tetapkan "table" yang paling sesuai dengan maksud pengguna.\n2. "bulan lalu"/"bulan ini"/"tahun" \u2192 gunakan operator between dengan dua tanggal [dari, ke] (format YYYY-MM-DD).\n3. Kata status tak selesai/kurang \u2192 gunakan operator like dengan nilai parsial (mis. "belum" atau "kurang").\n4. Nama siswa \u2192 field nama_siswa dengan operator like (nilai tanpa %% di sini).\n5. Hanya gunakan kolom yang terdaftar di atas; abaikan kolom lain.\n6. Kelas disetel otomatis oleh sistem, TIDAK perlu dianggap dari kalimat.\nKELUARKAN HANYA SATU OBJEK JSON (tanpa markdown, tanpa teks lain) format persis:\n' + schema + '\n\nKALIMAT PENGGUNA: "' + teks + '"';
  const ai = await geminiJSON(c, prompt, 0.2, 1e3);
  if (!ai.success) return ai;
  const parsed = ai.parsed;
  if (!parsed || !parsed.table) return { success: false, message: "AI tidak dapat mengartikan pencarian. Coba lebih spesifik." };
  return { success: true, parsed };
}
__name(parseSearchQuery, "parseSearchQuery");
async function extractDataEntry(c, teks, konteks) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: 'Kunci Gemini belum diset. Jalankan setGeminiKey("...") di editor.' };
  teks = String(teks || "").trim();
  if (teks.length < 10) return { success: false, message: "Teks terlalu pendek. Tempel catatan mentah yang cukup." };
  konteks = konteks || {};
  const prompt = 'Kamu adalah asisten input data. Ekstrak informasi dari catatan mentah guru di bawah menjadi JSON terstruktur untuk form entri tugas/aktivitas.\n\nTUGAS: Isi sebanyak mungkin bidang berikut berdasarkan teks (kosongkan bila tak ada):\n{"nama":"<nama tugas/aktivitas>","tanggal":"<YYYY-MM-DD>","tenggat":"<YYYY-MM-DD>","deskripsi":"<rangkuman singkat>"}\n\nPANDUAN:\n1. "nama" = tema/topik utama (mis. "Ekstraksi DNA", "Praktikum Titrasi").\n2. "tanggal" = tanggal pelaksanaan/kegiatan; "tenggat" = batas waktu pengumpulan/deadline. Jika teks menyebut "dikumpulkan"/"deadline"/"terakhir" \u2192 tenggat.\n3. Tanggal ubah ke format YYYY-MM-DD; jika hanya disebutkan relatif (mis. "Senin", "besok") dan konteks hari ini = ' + String(konteks.tanggal || "") + ', hitung perkiraan tanggalnya.\n4. "deskripsi" = rangkuman 1-2 kalimat dari isi catatan.\n5. Jangan menambah informasi yang tidak ada di teks.\nKELUARKAN HANYA SATU OBJEK JSON (tanpa markdown, tanpa teks lain).\n\nCATATAN MENTAH:\n' + teks;
  const ai = await geminiJSON(c, prompt, 0.2, 800);
  if (!ai.success) return ai;
  const d = ai.parsed || {};
  return { success: true, nama: String(d.nama || "").trim(), tanggal: String(d.tanggal || "").trim(), tenggat: String(d.tenggat || "").trim(), deskripsi: String(d.deskripsi || "").trim(), raw: d };
}
__name(extractDataEntry, "extractDataEntry");
function aiGradePrompt(jawaban, pertanyaan, kunci, bobot) {
  const b = Math.max(1, parseInt(String(bobot), 10) || 5);
  return "Kamu adalah guru penilai ulangan (CBT) yang teliti dan adil. Nilailah jawaban ESSAY siswa berdasarkan PEDOMAN/RUBRIK yang diberikan. Berikan skor dalam rentang 0 sampai " + b + " (" + b + " = sempurna) dan umpan balik singkat (1-2 kalimat, bahasa Indonesia).\n\nPERTANYAAN:\n" + (pertanyaan || "(tidak ada)") + "\n\nPEDOMAN / KUNCI JAWABAN:\n" + (kunci || "(tidak ada pedoman \u2014 gunakan penilaian profesional)") + "\n\nJAWABAN SISWA:\n" + (jawaban || "(kosong)") + '\n\nJAWABAN KOSONG \u2192 skor 0.\nKELUARKAN HANYA SATU OBJEK JSON (tanpa markdown, tanpa teks lain) persis format:\n{"skor": <angka 0..' + b + '>, "feedback": "<umpan balik singkat>"}';
}
__name(aiGradePrompt, "aiGradePrompt");
async function aiCallGrade(c, jawaban, pertanyaan, kunci, bobot) {
  const key = geminiKey(c);
  if (!key) return { success: false, message: "Kunci Gemini belum diset." };
  const prompt = aiGradePrompt(jawaban, pertanyaan, kunci, bobot);
  const r = await callGemini(c, prompt, 0.2, 600);
  if (!r.ok || !r.text) return { success: false, message: r.error };
  const parsed = extractJson(r.text);
  if (!parsed || parsed.skor === void 0) return { success: false, message: "AI tidak mengembalikan skor valid." };
  let skor = parseFloat(parsed.skor);
  if (isNaN(skor)) skor = 0;
  skor = Math.max(0, Math.min(Number(bobot), skor));
  return { success: true, skor, feedback: String(parsed.feedback || "").trim() };
}
__name(aiCallGrade, "aiCallGrade");

// src/pdf.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
function esc(v) {
  return String(v === null || v === void 0 ? "" : v).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
}
__name(esc, "esc");
function fmtN(v) {
  return v === "" || v === null || v === void 0 ? "-" : String(v);
}
__name(fmtN, "fmtN");
async function waliKelasNama(db, kelas) {
  try {
    const r = await all(db, "SELECT nama_lengkap AS nama FROM users WHERE role='Walikelas' AND kelas=? LIMIT 1", [kelas]);
    return r[0]?.nama ? String(r[0].nama) : "-";
  } catch {
    return "-";
  }
}
__name(waliKelasNama, "waliKelasNama");
async function getTA(db) {
  try {
    const ta = await all(db, "SELECT setting_value FROM settings WHERE setting_key='TA_AKTIF'");
    const sm = await all(db, "SELECT setting_value FROM settings WHERE setting_key='SEMESTER'");
    return { ta: ta[0]?.setting_value ? String(ta[0].setting_value) : "2025/2026", sem: sm[0]?.setting_value ? String(sm[0].setting_value) : "1" };
  } catch {
    return { ta: "2025/2026", sem: "1" };
  }
}
__name(getTA, "getTA");
async function buildHtml(db, opts) {
  const ta = await getTA(db);
  const widthClamp = /* @__PURE__ */ __name((w) => Math.max(24, Math.min(w, 500)), "widthClamp");
  let html = `<!DOCTYPE html><html lang="id"><head><meta charset="utf-8"><title>${esc(opts.title)}</title>`;
  html += `<style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:Arial,sans-serif;color:#111;font-size:10pt;padding:28px 30px}
    .kop{text-align:center;margin-bottom:14px}
    .kop .sekolah{font-weight:bold;font-size:11pt}
    .kop .sub{font-size:8pt;color:#555;margin-top:2px}
    h1{font-size:15pt;text-align:center;margin:14px 0 2px}
    .cls{text-align:center;font-size:10pt;margin:2px 0}
    .subtitle{text-align:center;font-size:10pt;font-style:italic;color:#333;margin-bottom:10px}
    h2{font-size:11pt;margin:14px 0 6px}
    table{border-collapse:collapse;width:100%;margin:6px 0}
    th,td{border:1px solid #bbb;padding:3px 5px;font-size:8pt;text-align:left}
    th{background:#eee;font-weight:bold}
    tr:nth-child(even) td{background:#fafafa}
    .note{font-size:8pt;font-style:italic;color:#555;margin-top:8px}
    .space{height:10px}
  </style></head><body>`;
  html += `<div class="kop"><div class="sekolah">SEKOLAH MENENGAH \u2014 KELAAS</div><div class="sub">Laporan Akademik Siswa \u2022 Tahun Ajaran ${esc(ta.ta)} \u2022 Semester ${esc(ta.sem)}</div></div>`;
  html += `<h1>${esc(opts.title)}</h1>`;
  if (opts.kelas) html += `<div class="cls">Kelas: ${esc(opts.kelas)}</div>`;
  if (opts.subtitle) html += `<div class="subtitle">${esc(opts.subtitle)}</div>`;
  html += `<div class="space"></div>`;
  for (const sec of opts.sections ?? []) {
    html += `<h2>${esc(sec.heading)}</h2>`;
    if (sec.note) {
      html += `<div>${esc(sec.note)}</div><div class="space"></div>`;
    }
    if (sec.table) {
      const headers = sec.table.headers;
      const rows = sec.table.rows;
      if (rows.length) {
        html += `<table><thead><tr>${headers.map((h) => `<th>${esc(h)}</th>`).join("")}</tr></thead><tbody>`;
        for (const row of rows) {
          html += `<tr>${headers.map((_, c) => `<td>${esc(fmtN(row[c]))}</td>`).join("")}</tr>`;
        }
        html += `</tbody></table>`;
      } else {
        html += `<div>Belum ada data.</div>`;
      }
    }
  }
  for (const n of opts.notes ?? []) {
    html += `<div class="note">${esc(n)}</div>`;
  }
  html += `</body></html>`;
  return html;
}
__name(buildHtml, "buildHtml");
function pdfPayload(html, filename) {
  const b64 = btoa(unescape(encodeURIComponent(html)));
  return { success: true, base64: b64, filename: filename.replace(/\s+/g, "_") + ".html", mimeType: "text/html", html };
}
__name(pdfPayload, "pdfPayload");
async function generateRekapNilaiPDF(db, nip, kelas, mapel) {
  const rekap = await getRekapNilai(db, nip, kelas, mapel);
  const students = rekap && rekap.students || [];
  const headers = ["No", "NIS", "Nama"];
  const jenis = ["NH1", "NH2", "NH3", "NH4", "NH5", "NH6", "NH7", "NH8", "PSTS", "PSAS"];
  for (const j of jenis) headers.push(j);
  headers.push("Akhir");
  const rows = students.map((x, i) => {
    const row = [i + 1, x.nis, x.nama];
    for (const j of jenis) row.push(x[j] == null ? "-" : x[j]);
    row.push(x.akhir == null ? "-" : x.akhir);
    return row;
  });
  const html = await buildHtml(db, {
    title: "REKAP NILAI SISWA",
    subtitle: "Mata Pelajaran: " + (rekap?.mapel || mapel || "-"),
    kelas,
    sections: [{ heading: "", table: { headers, rows } }],
    notes: [
      "Keterangan: NH = Nilai Harian, PSTS = Penilaian Sumatif Tengah Semester, PSAS = Penilaian Sumatif Akhir Semester.",
      "Wali Kelas: " + await waliKelasNama(db, kelas)
    ]
  });
  return pdfPayload(html, "Rekap_Nilai_" + kelas);
}
__name(generateRekapNilaiPDF, "generateRekapNilaiPDF");
async function getRekapNilai(db, nip, kelas, mapel) {
  const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
  let sql = "SELECT nis, jenis, nilai FROM nilai WHERE nip=? AND kelas=?";
  const p = [nip, kelas];
  if (mapel) {
    sql += " AND mapel=?";
    p.push(mapel);
  }
  const rows = await all(db, sql, p);
  const map = {};
  for (const n of rows) {
    const key = String(n.nis);
    if (!map[key]) map[key] = {};
    map[key][String(n.jenis)] = Number(n.nilai) || 0;
  }
  const jenisList = ["NH1", "NH2", "NH3", "NH4", "NH5", "NH6", "NH7", "NH8", "PSTS", "PSAS"];
  const students = [];
  for (const s4 of siswa) {
    const row = { nis: s4.nis, nama: s4.nama };
    const vals = [];
    for (const j of jenisList) {
      const v = map[String(s4.nis)]?.[j] ?? null;
      row[j] = v;
      if (v !== null) vals.push(v);
    }
    row.akhir = vals.length ? Math.round(vals.reduce((a, b) => a + b, 0) / vals.length * 10) / 10 : null;
    students.push(row);
  }
  return { students, mapel: mapel || "-", kelas };
}
__name(getRekapNilai, "getRekapNilai");
async function generateRekapanKelasPDF(db, kelas, start, end, label) {
  const data = await getRekapData(db, kelas, "", start, end);
  const students = data.students || [];
  const dates = data.dates || [];
  const headers = ["No", "NIS", "Nama"];
  for (const d of dates) headers.push(fmtDateID(String(d)).substring(0, 5));
  headers.push("H", "S", "I", "A", "Total");
  const rows = students.map((x, i) => {
    const rec = x.records || {};
    const sum = x.summary || {};
    const row = [i + 1, x.nis, x.nama];
    for (const d of dates) row.push(rec[d] || "-");
    row.push(sum.Hadir || 0, sum.Sakit || 0, sum.Izin || 0, sum.Alfa || 0, x.total || 0);
    return row;
  });
  const html = await buildHtml(db, {
    title: "REKAP KEHADIRAN KELAS",
    subtitle: label || "Periode: " + start + " s/d " + end,
    kelas,
    sections: [{ heading: "", table: { headers, rows } }],
    notes: [
      "Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa (tanpa keterangan).",
      "Wali Kelas: " + await waliKelasNama(db, kelas)
    ]
  });
  return pdfPayload(html, "Rekap_Kehadiran_" + kelas);
}
__name(generateRekapanKelasPDF, "generateRekapanKelasPDF");
async function generateRekapanPDF(db, kelas, nis, start, end, label) {
  const data = await getRekapData(db, kelas, nis, start, end);
  const s4 = (data.students || [])[0] || { nis, nama: nis, records: {}, summary: {}, total: 0 };
  const rows = [
    ["Hadir", s4.summary?.Hadir || 0],
    ["Sakit", s4.summary?.Sakit || 0],
    ["Izin", s4.summary?.Izin || 0],
    ["Alfa", s4.summary?.Alfa || 0],
    ["Total", s4.total || 0]
  ];
  const html = await buildHtml(db, {
    title: "REKAP KEHADIRAN SISWA",
    subtitle: label || "Periode: " + start + " s/d " + end,
    kelas,
    sections: [
      { heading: "Nama: " + s4.nama },
      { heading: "NIS: " + s4.nis },
      { heading: "", table: { headers: ["Keterangan", "Jumlah"], rows } }
    ],
    notes: ["Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa.", "Wali Kelas: " + await waliKelasNama(db, kelas)]
  });
  return pdfPayload(html, "Rekapan_" + nis);
}
__name(generateRekapanPDF, "generateRekapanPDF");
async function generateRekapMapelPDF(db, nip, kelas, mapel, start, end, label, guruNama) {
  const data = await getPresensiMapelRekap(db, nip, kelas, mapel, start, end);
  const students = data.students || [];
  const dates = data.dates || [];
  const headers = ["No", "NIS", "Nama"];
  for (const d of dates) headers.push(fmtDateID(String(d)).substring(0, 5));
  headers.push("H", "S", "I", "A", "D", "Total");
  const rows = students.map((x, i) => {
    const rec = x.records || {};
    const sm = x.summary || {};
    const row = [i + 1, x.nis, x.nama];
    for (const d of dates) row.push(rec[d] || "-");
    row.push(sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0);
    return row;
  });
  const html = await buildHtml(db, {
    title: "REKAP PRESENSI MAPEL",
    subtitle: label || "Periode: " + start + " s/d " + end,
    kelas,
    sections: [
      { heading: "Mapel: " + mapel },
      { heading: "", table: { headers, rows } }
    ],
    notes: ["Keterangan: H = Hadir, S = Sakit, I = Izin, A = Alfa, D = Dispensasi.", "Guru Mapel: " + (guruNama || "-")]
  });
  return pdfPayload(html, "Rekap_Presensi_" + kelas + "_" + mapel);
}
__name(generateRekapMapelPDF, "generateRekapMapelPDF");
async function generateLaporanAdminPDF(db, nip, kelas, mapel, start, end) {
  const d = await getLaporanAdminData(db, nip, kelas, mapel, start, end);
  const students = d.students || [];
  const jurnal = d.jurnal || [];
  const h1 = ["No", "NIS", "Nama", "Hadir", "Sakit", "Izin", "Alfa", "Disp.", "Total"];
  const rows1 = students.map((x, i) => {
    const sm = x.summary || {};
    return [i + 1, x.nis, x.nama, sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0];
  });
  const jrows = jurnal.map((x, i) => [i + 1, fmtDateID(String(x.tanggal)), "Jam " + (x.jamKe || "-"), x.materi, x.kegiatan]);
  const html = await buildHtml(db, {
    title: "LAPORAN ADMINISTRASI PEMBELAJARAN",
    subtitle: "Periode: " + start + " s/d " + end,
    kelas,
    sections: [
      { heading: "Mapel: " + mapel },
      { heading: "A. REKAP PRESENSI SISWA", table: { headers: h1, rows: rows1 } },
      { heading: "B. JURNAL MENGAJAR", table: { headers: ["No", "Tanggal", "Jam", "Materi", "Kegiatan"], rows: jrows } }
    ],
    notes: ["Jumlah baris direvisi: " + (d.revisiCount || 0)]
  });
  return pdfPayload(html, "Laporan_Administrasi_" + kelas + "_" + mapel);
}
__name(generateLaporanAdminPDF, "generateLaporanAdminPDF");
async function generateRekapLengkapPDF(db, nip, kelas, mapel, start, end) {
  const rekap = await getRekapNilai(db, nip, kelas, mapel);
  const students = rekap && rekap.students || [];
  const pres = await getPresensiMapelRekap(db, nip, kelas, mapel, start, end);
  const pStudents = pres.students || [];
  const pDates = pres.dates || [];
  const admin = await getLaporanAdminData(db, nip, kelas, mapel, start, end);
  const jurnal = admin.jurnal || [];
  const h1 = ["No", "NIS", "Nama"];
  for (let j = 0; j < 8; j++) h1.push("NH" + (j + 1));
  h1.push("PSTS", "PSAS", "Akhir");
  const r1 = students.map((x, i) => {
    const row = [i + 1, x.nis, x.nama];
    for (let k = 0; k < 8; k++) row.push(x["NH" + (k + 1)] == null ? "-" : x["NH" + (k + 1)]);
    row.push(x.PSTS == null ? "-" : x.PSTS, x.PSAS == null ? "-" : x.PSAS, x.akhir == null ? "-" : x.akhir);
    return row;
  });
  const h2 = ["No", "NIS", "Nama"];
  for (const d of pDates) h2.push(fmtDateID(String(d)).substring(0, 5));
  h2.push("H", "S", "I", "A", "D", "Total");
  const r2 = pStudents.map((x, i) => {
    const rec = x.records || {};
    const sm = x.summary || {};
    const row = [i + 1, x.nis, x.nama];
    for (const d of pDates) row.push(rec[d] || "-");
    row.push(sm.Hadir || 0, sm.Sakit || 0, sm.Izin || 0, sm.Alfa || 0, sm.Dispensasi || 0, x.total || 0);
    return row;
  });
  const r3 = jurnal.map((x, i) => [i + 1, fmtDateID(String(x.tanggal)), "Jam " + (x.jamKe || "-"), x.materi, x.kegiatan]);
  const html = await buildHtml(db, {
    title: "REKAP LENGKAP PEMBELAJARAN",
    subtitle: "Mapel: " + mapel + " \u2022 Periode: " + start + " s/d " + end,
    kelas,
    sections: [
      { heading: "A. NILAI SISWA", table: { headers: h1, rows: r1 } },
      { heading: "B. REKAP PRESENSI MAPEL", table: { headers: h2, rows: r2 } },
      { heading: "C. JURNAL MENGAJAR", table: { headers: ["No", "Tanggal", "Jam", "Materi", "Kegiatan"], rows: r3 } }
    ],
    notes: [
      "Keterangan: NH = Nilai Harian, PSTS = Penilaian Sumatif Tengah Semester, PSAS = Penilaian Sumatif Akhir Semester.",
      "Wali Kelas / Guru: " + await waliKelasNama(db, kelas)
    ]
  });
  return pdfPayload(html, "Rekap_Nilai_Kehadiran_" + kelas);
}
__name(generateRekapLengkapPDF, "generateRekapLengkapPDF");
async function generateModulPDF(db, text, judul) {
  const md = String(text || "").trim();
  const html = await buildHtml(db, { title: judul || "Modul_Ajar", notes: [md] });
  return pdfPayload(html, judul || "Modul_Ajar");
}
__name(generateModulPDF, "generateModulPDF");
async function getRekapData(db, kelas, nis, start, end) {
  let sql = "SELECT nis, nama_siswa AS nama, jk FROM siswa WHERE kelas=?";
  const p = [kelas];
  if (nis) {
    sql += " AND nis=?";
    p.push(nis);
  }
  const siswa = await all(db, sql, p);
  sql = "SELECT tanggal, nis, status FROM kehadiran WHERE kelas=? AND tanggal>=? AND tanggal<=?";
  const p2 = [kelas, start, end];
  if (nis) {
    sql += " AND nis=?";
    p2.push(nis);
  }
  const raw2 = await all(db, sql, p2);
  const dates = Array.from(new Set(raw2.map((r) => String(r.tanggal)))).sort();
  const res = [];
  for (const s4 of siswa) {
    const recs = {};
    const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0 };
    for (const r of raw2) {
      if (String(r.nis) === String(s4.nis)) {
        recs[String(r.tanggal)] = String(r.status);
        const st = String(r.status);
        if (st in sum) sum[st]++;
      }
    }
    res.push({ nis: s4.nis, nama: s4.nama, jk: s4.jk, records: recs, summary: sum, total: sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa });
  }
  return { students: res, dates };
}
__name(getRekapData, "getRekapData");
async function getPresensiMapelRekap(db, nip, kelas, mapel, start, end) {
  const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
  let raw2;
  if (start && end) {
    raw2 = await all(db, "SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?", [nip, kelas, mapel, start, end]);
  } else {
    raw2 = await all(db, "SELECT tanggal, nis, status FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=?", [nip, kelas, mapel]);
  }
  const dates = Array.from(new Set(raw2.map((r) => String(r.tanggal)))).sort();
  const res = [];
  for (const s4 of siswa) {
    const recs = {};
    const sum = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
    for (const r of raw2) {
      if (String(r.nis) === String(s4.nis)) {
        recs[String(r.tanggal)] = String(r.status);
        const st = String(r.status);
        if (st in sum) sum[st]++;
      }
    }
    res.push({ nis: s4.nis, nama: s4.nama, records: recs, summary: sum, total: sum.Hadir + sum.Sakit + sum.Izin + sum.Alfa + sum.Dispensasi });
  }
  return { students: res, dates };
}
__name(getPresensiMapelRekap, "getPresensiMapelRekap");
async function getLaporanAdminData(db, nip, kelas, mapel, start, end) {
  const siswa = await all(db, "SELECT nis, nama_siswa AS nama FROM siswa WHERE kelas=? ORDER BY nama_siswa", [kelas]);
  const raw2 = await all(db, "SELECT tanggal, nis, status, updated_at FROM presensi_mapel WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=?", [nip, kelas, mapel, start, end]);
  let revisi = 0;
  const byNis = {};
  for (const r of raw2) {
    if (r.updated_at) revisi++;
    const key = String(r.nis);
    if (!byNis[key]) byNis[key] = {};
    byNis[key][String(r.status)] = (byNis[key][String(r.status)] || 0) + 1;
  }
  const students = [];
  for (const s4 of siswa) {
    const sm = { Hadir: 0, Sakit: 0, Izin: 0, Alfa: 0, Dispensasi: 0 };
    for (const [k, v] of Object.entries(byNis[String(s4.nis)] || {})) if (k in sm) sm[k] = v;
    const tot = sm.Hadir + sm.Sakit + sm.Izin + sm.Alfa + sm.Dispensasi;
    students.push({ nis: s4.nis, nama: s4.nama, summary: sm, total: tot, pct: tot ? Math.round(sm.Hadir / tot * 100) : 0 });
  }
  const jurnal = await all(db, "SELECT tanggal, jam_ke AS jamKe, materi, kegiatan, status FROM jurnal_mengajar WHERE nip=? AND kelas=? AND mapel=? AND tanggal>=? AND tanggal<=? ORDER BY tanggal, jam_ke", [nip, kelas, mapel, start, end]);
  return { students, dates: [], jurnal, revisiCount: revisi };
}
__name(getLaporanAdminData, "getLaporanAdminData");

// src/api-bridge.ts
async function callAction(c, method, action, params = {}, payload) {
  const env2 = c.env;
  if (!env2.__app || typeof env2.__app.fetch !== "function") {
    return { success: false, message: "Internal bridge tidak tersedia (__app)" };
  }
  const url = new URL("/api", c.req.url);
  url.searchParams.set("action", action);
  for (const [k, v] of Object.entries(params)) {
    if (v !== void 0 && v !== null && v !== "") url.searchParams.set(k, String(v));
  }
  const init = { method, headers: { "Content-Type": "application/json" } };
  if (payload !== void 0) init.body = JSON.stringify(payload);
  const request = new Request(url.toString(), init);
  const fetchFn = env2.__app.fetch;
  const res = await fetchFn(request, c.env, c.executionCtx);
  try {
    return await res.json();
  } catch {
    return { success: false, message: "Gagal parse response" };
  }
}
__name(callAction, "callAction");
var FUNCS = {
  // ===== AUTH =====
  validateLogin: { method: "POST", action: "login", args: ["username", "password"], body: ["username", "password"] },
  register: { method: "POST", action: "register", args: ["username", "password", "namaLengkap", "role", "kelas"], body: ["username", "password", "namaLengkap", "role", "kelas"] },
  logActivity: { method: "POST", action: "log-aktivitas", args: ["username", "role", "aksi", "detail"], body: ["username", "role", "aksi", "detail"] },
  getTAInfo: { method: "GET", action: "settings", args: [] },
  setTA: { method: "POST", action: "settings", args: ["ta", "semester"], body: ["ta", "semester"] },
  // ===== SUBSCRIPTION =====
  getMyPlan: { method: "GET", action: "plan", args: [] },
  setUserPlan: { method: "PUT", action: "plan", args: ["username", "plan_type", "duration_days", "trial_days"], body: ["username", "plan_type", "duration_days", "trial_days"] },
  // ===== DASHBOARD =====
  getDashboardData: { method: "GET", action: "dashboard", args: ["kelas", "role", "nip"], q: ["kelas", "role", "nip"] },
  getDashboardRekap: { method: "GET", action: "dashboard-rekap", args: ["kelas", "role", "nip"], q: ["kelas", "role", "nip"] },
  getEarlyWarning: { method: "GET", action: "early-warning", args: ["kelas"], q: ["kelas"] },
  getMyData: { method: "GET", action: "my-data", args: ["kelas", "nis"], q: ["kelas", "nis"] },
  getOrtuData: { method: "GET", action: "ortu-data", args: ["nis"], q: ["nis"] },
  getGuruDashboard: { method: "GET", action: "guru-dashboard", args: ["nip"], q: ["nip"] },
  getGuruInfo: { method: "GET", action: "guru-info", args: ["nip"], q: ["nip"] },
  getMapelGuruDiKelas: { method: "GET", action: "mapel-guru-kelas", args: ["nip", "kelas"], q: ["nip", "kelas"] },
  addKelasDiampu: { method: "POST", action: "guru-add-kelas", args: ["nip", "kelas"], body: ["nip", "kelas"] },
  // ===== SISWA =====
  getSiswaList: { method: "GET", action: "siswa", args: ["kelas"], q: ["kelas"] },
  getSiswaOptions: { method: "GET", action: "siswa-options", args: ["kelas"], q: ["kelas"] },
  addSiswa: { method: "POST", action: "siswa", args: ["kelas", "nis", "nama", "jk", "extra"], body: /* @__PURE__ */ __name((a) => ({ kelas: a[0], nis: a[1], nama: a[2], jk: a[3], ...a[4] || {} }), "body") },
  updateSiswa: { method: "PUT", action: "siswa", args: ["kelas", "oldNis", "nis", "nama", "jk", "extra"], body: /* @__PURE__ */ __name((a) => ({ kelas: a[0], oldNis: a[1], nis: a[2], nama: a[3], jk: a[4], ...a[5] || {} }), "body") },
  deleteSiswa: { method: "DELETE", action: "siswa", args: ["kelas", "nis"], q: ["kelas", "nis"] },
  importDataSiswa: { method: "POST", action: "siswa-import", args: ["arr", "kelas"], body: /* @__PURE__ */ __name((a) => ({ data: a[0], kelas: a[1] }), "body") },
  // ===== KEHADIRAN =====
  getKehadiranByDate: { method: "GET", action: "kehadiran", args: ["kelas", "tanggal"], q: ["kelas", "tanggal"] },
  submitBulkKehadiran: { method: "POST", action: "kehadiran", args: ["kelas", "tanggal", "records"], body: ["kelas", "tanggal", "records"] },
  // ===== TATIB / KAS / STRUKTUR / INVENTARIS / PENGUMUMAN =====
  getTataTertibList: { method: "GET", action: "tatatertib", args: ["kelas"], q: ["kelas"] },
  addTataTertib: { method: "POST", action: "tatatertib", args: ["kelas", "tanggal", "nis", "pelanggaran", "poin"], body: ["kelas", "tanggal", "nis", "pelanggaran", "poin"] },
  deleteTataTertib: { method: "DELETE", action: "tatatertib", args: ["id"], q: ["id"] },
  getKasList: { method: "GET", action: "kas", args: ["kelas"], q: ["kelas"] },
  getKasSummary: { method: "GET", action: "kas-summary", args: ["kelas"], q: ["kelas"] },
  addKas: { method: "POST", action: "kas", args: ["kelas", "tanggal", "jenis", "jumlah", "keterangan"], body: ["kelas", "tanggal", "jenis", "jumlah", "keterangan"] },
  deleteKas: { method: "DELETE", action: "kas", args: ["id"], q: ["id"] },
  getStrukturKelas: { method: "GET", action: "struktur", args: ["kelas"], q: ["kelas"] },
  saveStrukturKelas: { method: "POST", action: "struktur", args: ["kelas", "data"], body: /* @__PURE__ */ __name((a) => ({ kelas: a[0], data: a[1] }), "body") },
  getInventarisList: { method: "GET", action: "inventaris", args: ["kelas"], q: ["kelas"] },
  addInventaris: { method: "POST", action: "inventaris", args: ["kelas", "nama", "jumlah", "kondisi", "keterangan"], body: ["kelas", "nama", "jumlah", "kondisi", "keterangan"] },
  deleteInventaris: { method: "DELETE", action: "inventaris", args: ["id"], q: ["id"] },
  getPengumumanList: { method: "GET", action: "pengumuman", args: ["kelas"], q: ["kelas"] },
  addPengumuman: { method: "POST", action: "pengumuman", args: ["kelas", "judul", "isi", "penulis"], body: ["kelas", "judul", "isi", "penulis"] },
  deletePengumuman: { method: "DELETE", action: "pengumuman", args: ["id"], q: ["id"] },
  // ===== JADWAL / PIKET =====
  getJadwalPelajaran: { method: "GET", action: "jadwal", args: ["kelas"], q: ["kelas"] },
  addJadwalPelajaran: { method: "POST", action: "jadwal", args: ["kelas", "hari", "jam", "mapel", "nip"], body: ["kelas", "hari", "jam", "mapel", "nip"] },
  updateJadwalPelajaran: { method: "PUT", action: "jadwal", args: ["id", "kelas", "hari", "jam", "mapel", "nip"], body: ["id", "kelas", "hari", "jam", "mapel", "nip"] },
  deleteJadwalPelajaran: { method: "DELETE", action: "jadwal", args: ["id"], q: ["id"] },
  getJadwalMengajar: { method: "GET", action: "jadwal-mengajar", args: ["nip"], q: ["nip"] },
  getJadwalByGuru: { method: "GET", action: "jadwal-by-guru", args: ["nip"], q: ["nip"] },
  getJadwalPiket: { method: "GET", action: "jadwal-piket", args: ["kelas"], q: ["kelas"] },
  savePiketForDay: { method: "POST", action: "jadwal-piket", args: ["kelas", "hari", "students"], body: ["kelas", "hari", "students"] },
  // ===== BIMBINGAN / KUNJUNGAN =====
  getJurnalBimbingan: { method: "GET", action: "jurnal-bimbingan", args: ["kelas"], q: ["kelas"] },
  addJurnalBimbingan: { method: "POST", action: "jurnal-bimbingan", args: ["kelas", "tanggal", "kategori", "isi", "tindakLanjut"], body: ["kelas", "tanggal", "kategori", "isi", "tindakLanjut"] },
  deleteJurnalBimbingan: { method: "DELETE", action: "jurnal-bimbingan", args: ["id"], q: ["id"] },
  getKunjunganRumah: { method: "GET", action: "kunjungan-rumah", args: ["kelas"], q: ["kelas"] },
  addKunjunganRumah: { method: "POST", action: "kunjungan-rumah", args: ["kelas", "tanggal", "nisNama", "alamat", "hasil", "tindakLanjut", "petugas"], body: ["kelas", "tanggal", "nisNama", "alamat", "hasil", "tindakLanjut", "petugas"] },
  deleteKunjunganRumah: { method: "DELETE", action: "kunjungan-rumah", args: ["id"], q: ["id"] },
  // ===== JURNAL MENGAJAR =====
  getJurnalMengajar: { method: "GET", action: "jurnal-mengajar", args: ["nip"], q: ["nip"] },
  addJurnalMengajar: { method: "POST", action: "jurnal-mengajar", args: ["nip", "tanggal", "kelas", "mapel", "jam", "materi", "kegiatan", "extra"], body: /* @__PURE__ */ __name((a) => ({ nip: a[0], tanggal: a[1], kelas: a[2], mapel: a[3], jam: a[4], materi: a[5], kegiatan: a[6], ...a[7] || {} }), "body") },
  updateJurnalMengajarFull: { method: "PUT", action: "jurnal-mengajar", args: ["id", "p"], body: /* @__PURE__ */ __name((a) => ({ id: a[0], ...a[1] || {} }), "body") },
  deleteJurnalMengajar: { method: "DELETE", action: "jurnal-mengajar", args: ["id", "nip"], q: ["id", "nip"] },
  getPresensiMapelByDate: { method: "GET", action: "presensi-mapel", args: ["nip", "kelas", "tanggal"], q: ["nip", "kelas", "tanggal"] },
  submitPresensiMapel: { method: "POST", action: "presensi-mapel", args: ["nip", "kelas", "mapel", "tanggal", "records"], body: ["nip", "kelas", "mapel", "tanggal", "records"] },
  submitPresensiMapelV2: { method: "POST", action: "presensi-mapel", args: ["nip", "kelas", "mapel", "tanggal", "jamKe", "records"], body: ["nip", "kelas", "mapel", "tanggal", "jamKe", "records"] },
  getPresensiRiwayat: { method: "GET", action: "presensi-riwayat", args: ["nip", "tanggal", "kelas"], q: ["nip", "tanggal", "kelas"] },
  updatePresensiBulk: { method: "PUT", action: "presensi-mapel", args: ["updates"], body: ["updates"] },
  // ===== NILAI =====
  getRekapNilai: { method: "GET", action: "nilai-rekap", args: ["nip", "kelas", "mapel"], q: ["nip", "kelas", "mapel"] },
  getPeringkatKelas: { method: "GET", action: "nilai-peringkat", args: ["nip", "kelas", "mapel"], q: ["nip", "kelas", "mapel"] },
  saveNilaiBulk: { method: "POST", action: "nilai-bulk", args: ["nip", "kelas", "mapel", "entries"], body: ["nip", "kelas", "mapel", "entries"] },
  getAnalisisNilai: { method: "GET", action: "analisis-nilai", args: ["nip", "kelas", "mapel"], q: ["nip", "kelas", "mapel"] },
  // ===== USERS / LOG =====
  getAllUsers: { method: "GET", action: "users", args: [] },
  addUser: { method: "POST", action: "users", args: ["username", "password", "role", "kelas", "nama", "kodeGuru"], body: ["username", "password", "role", "kelas", "nama", "kodeGuru"] },
  updateUser: { method: "PUT", action: "users", args: ["id", "username", "password", "role", "kelas", "nama", "kodeGuru"], body: ["id", "username", "password", "role", "kelas", "nama", "kodeGuru"] },
  deleteUser: { method: "DELETE", action: "users", args: ["id"], q: ["id"] },
  getLogAktivitas: { method: "GET", action: "log-aktivitas", args: [] },
  // ===== GURU PROFILE / MATERI / MODUL =====
  getGuruProfil: { method: "GET", action: "guru-profil", args: ["nip"], q: ["nip"] },
  saveGuruProfil: { method: "POST", action: "guru-profil", args: ["p"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  getMateri: { method: "GET", action: "materi", args: ["nip"], q: ["nip"] },
  addMateri: { method: "POST", action: "materi", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteMateri: { method: "DELETE", action: "materi", args: ["id"], q: ["id"] },
  getModulAjar: { method: "GET", action: "modul-ajar", args: ["nip"], q: ["nip"] },
  addModulAjar: { method: "POST", action: "modul-ajar", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteModulAjar: { method: "DELETE", action: "modul-ajar", args: ["id"], q: ["id"] },
  // ===== TUGAS / PENGUMPULAN =====
  getTugas: { method: "GET", action: "tugas", args: ["nip"], q: ["nip"] },
  addTugas: { method: "POST", action: "tugas", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteTugas: { method: "DELETE", action: "tugas", args: ["id"], q: ["id"] },
  getPengumpulan: { method: "GET", action: "pengumpulan", args: ["tugasId"], q: ["tugasId"] },
  nilaiPengumpulan: { method: "PUT", action: "pengumpulan", args: ["id", "nilai", "feedback"], body: ["id", "nilai", "feedback"] },
  // ===== CATATAN PERILAKU / PORTOFOLIO =====
  getCatatanPerilaku: { method: "GET", action: "catatan-perilaku", args: ["nip", "kelas"], q: ["nip", "kelas"] },
  addCatatanPerilaku: { method: "POST", action: "catatan-perilaku", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteCatatanPerilaku: { method: "DELETE", action: "catatan-perilaku", args: ["id"], q: ["id"] },
  getPortofolio: { method: "GET", action: "portofolio", args: ["nip", "nis"], q: ["nip", "nis"] },
  addPortofolio: { method: "POST", action: "portofolio", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deletePortofolio: { method: "DELETE", action: "portofolio", args: ["id"], q: ["id"] },
  // ===== RUBRIK / AGENDA =====
  getRubrik: { method: "GET", action: "rubrik", args: ["nip"], q: ["nip"] },
  addRubrik: { method: "POST", action: "rubrik", args: ["nip", "nama", "komponen"], body: ["nip", "nama", "komponen"] },
  deleteRubrik: { method: "DELETE", action: "rubrik", args: ["id"], q: ["id"] },
  getAgenda: { method: "GET", action: "agenda", args: ["nip"], q: ["nip"] },
  addAgenda: { method: "POST", action: "agenda", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteAgenda: { method: "DELETE", action: "agenda", args: ["id"], q: ["id"] },
  // ===== PRESENSI GURU =====
  getPresensiGuru: { method: "GET", action: "presensi-guru", args: ["nip"], q: ["nip"] },
  addPresensiGuru: { method: "POST", action: "presensi-guru", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  // ===== TOOLMAN =====
  getKatalogAlat: { method: "GET", action: "katalog-alat", args: [] },
  addKatalogAlat: { method: "POST", action: "katalog-alat", args: ["kode", "nama", "spesifikasi", "jumlah", "kondisi", "lokasi"], body: ["kode", "nama", "spesifikasi", "jumlah", "kondisi", "lokasi"] },
  deleteKatalogAlat: { method: "DELETE", action: "katalog-alat", args: ["id"], q: ["id"] },
  getBahanPraktik: { method: "GET", action: "bahan-praktik", args: [] },
  addBahanPraktik: { method: "POST", action: "bahan-praktik", args: ["kode", "nama", "satuan", "stok", "stokMin", "kategori"], body: ["kode", "nama", "satuan", "stok", "stokMin", "kategori"] },
  updateStokBahan: { method: "PUT", action: "bahan-praktik", args: ["kode", "delta"], body: ["kode", "delta"] },
  deleteBahanPraktik: { method: "DELETE", action: "bahan-praktik", args: ["id"], q: ["id"] },
  getPeminjaman: { method: "GET", action: "peminjaman", args: [] },
  scanPeminjam: { method: "GET", action: "scan-peminjam", args: ["code"], q: ["code"] },
  addPeminjaman: { method: "POST", action: "peminjaman", args: ["kodeBarang", "peminjam", "jenis", "batas"], body: ["kodeBarang", "peminjam", "jenis", "batas"] },
  returnPeminjaman: { method: "PUT", action: "peminjaman", args: ["id"], body: ["id"] },
  getLaporanKerusakan: { method: "GET", action: "laporan-kerusakan", args: [] },
  addLaporanKerusakan: { method: "POST", action: "laporan-kerusakan", args: ["kode", "nama", "kerusakan", "pelapor", "jadwal"], body: ["kode", "nama", "kerusakan", "pelapor", "jadwal"] },
  updateStatusKerusakan: { method: "PUT", action: "laporan-kerusakan", args: ["id", "status"], body: ["id", "status"] },
  deleteLaporanKerusakan: { method: "DELETE", action: "laporan-kerusakan", args: ["id"], q: ["id"] },
  // ===== SETUP / TEST / BACKUP =====
  runSetup: { method: "POST", action: "setup", args: [] },
  runSetupGuruV2: { method: "POST", action: "setup-guru-v2", args: [] },
  runSetupCbt: { method: "POST", action: "setup-cbt", args: [] },
  runSetupBankSoal: { method: "POST", action: "setup-banksoal", args: [] },
  testKoneksi: { method: "GET", action: "test", args: [] },
  backupToDrive: { method: "GET", action: "backup-dump", args: [] },
  setupAutoBackup: { method: "GET", action: "backup-dump", args: [] },
  // GAS-only; pasrahkan hasil dump
  setupCbtCleanupTrigger: { method: "POST", action: "cbt-cleanup-expired", args: [] },
  // ===== BANK SOAL / CBT =====
  getBankSoalCbt: { method: "GET", action: "bank-soal", args: ["nip", "mapel", "jenis", "kelas"], q: ["nip", "mapel", "kelas"] },
  addBankSoalCbt: { method: "POST", action: "bank-soal", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  deleteBankSoalCbt: { method: "DELETE", action: "bank-soal", args: ["id"], q: ["id"] },
  deleteBankSoalBulk: { method: "DELETE", action: "bank-soal", args: ["ids"], body: /* @__PURE__ */ __name((a) => ({ ids: a[0] }), "body") },
  addBankSoalBulk: { method: "POST", action: "bank-soal", args: ["nip", "soal"], body: /* @__PURE__ */ __name((a) => ({ nip: a[0], soal: a[1] || [] }), "body") },
  addBankSoal: { method: "POST", action: "bank-soal", args: ["o"], body: /* @__PURE__ */ __name((a) => ({ nip: a[0]?.nip, soal: [a[0]] }), "body") },
  getBankSoal: { method: "GET", action: "bank-soal", args: ["nip", "mapel"], q: ["nip", "mapel"] },
  deleteBankSoal: { method: "DELETE", action: "bank-soal", args: ["id"], q: ["id"] },
  getCbtExams: { method: "GET", action: "cbt-exam", args: ["nip"], q: ["nip"] },
  createCbtExam: { method: "POST", action: "cbt-exam", args: ["o"], body: /* @__PURE__ */ __name((a) => a[0] || {}, "body") },
  setCbtStatus: { method: "PUT", action: "cbt-exam", args: ["id", "status"], body: ["id", "status"] },
  deleteCbtExam: { method: "DELETE", action: "cbt-exam", args: ["id"], q: ["id"] },
  getCbtHasil: { method: "GET", action: "cbt-hasil", args: ["examId"], q: ["examId"] },
  getCbtEssay: { method: "GET", action: "cbt-essay", args: ["examId", "soalId"], q: ["examId"] },
  nilaiEssayCbt: { method: "PUT", action: "cbt-essay", args: ["id", "nilai"], body: ["id", "nilai"] },
  cbtStart: { method: "POST", action: "cbt-mulai", args: ["token", "nis", "nama", "kelas"], body: ["token", "nis", "nama", "kelas"] },
  cbtAutosave: { method: "POST", action: "cbt-simpan-jawaban", args: ["sesiId", "nis", "soalId", "jawaban"], body: /* @__PURE__ */ __name((a) => ({ sesiId: a[0], soalId: a[2], jawaban: a[3] }), "body") },
  cbtSubmit: { method: "POST", action: "cbt-kumpulkan", args: ["sesiId", "nis", "jawabanArr"], body: /* @__PURE__ */ __name((a) => ({ sesiId: a[0], jawaban: a[2] }), "body") },
  getCbtRiwayatSiswa: { method: "GET", action: "cbt-riwayat-siswa", args: ["nis"], q: ["nis"] },
  cbtCleanupExpired: { method: "POST", action: "cbt-cleanup-expired", args: [] },
  // ===== REKAP / LAPORAN (data) =====
  getLaporanAdminData: { method: "GET", action: "laporan-admin", args: ["nip", "kelas", "mapel", "start", "end"], q: ["nip", "kelas", "mapel", "start", "end"] },
  getPresensiMapelRekap: { method: "GET", action: "presensi-mapel-rekap", args: ["nip", "kelas", "mapel", "start", "end"], q: ["nip", "kelas", "mapel", "start", "end"] },
  getWaliKelasNama: { method: "GET", action: "wali-kelas", args: ["kelas"], q: ["kelas"] }
};
async function aiNilaiEssayServer(c, jawabanId, sesiId, soalId) {
  const r = await callAction(c, "GET", "cbt-essay-detail", { id: jawabanId, sesiId, soalId });
  const jw = r.data;
  if (!jw) return { success: false, message: "Jawaban tidak ditemukan." };
  if (!jw.jawaban || !String(jw.jawaban).trim()) {
    await callAction(c, "PUT", "cbt-essay", {}, { id: jawabanId, nilai: 0 });
    return { success: true, skor: 0, feedback: "Tidak dijawab \u2014 skor 0.", kosong: true };
  }
  const ai = await aiCallGrade(c, jw.jawaban, jw.pertanyaan, jw.kunci, num(jw.bobot));
  if (!ai.success) return ai;
  await callAction(c, "PUT", "cbt-essay", {}, { id: jawabanId, nilai: ai.skor, feedback: ai.feedback, sumber: "ai" });
  return { success: true, skor: ai.skor, feedback: ai.feedback };
}
__name(aiNilaiEssayServer, "aiNilaiEssayServer");
async function autoNilaiEssayCbtServer(c, examId) {
  const rowsR = await callAction(c, "GET", "cbt-essay", { examId });
  const rows = rowsR.data || [];
  if (!rows.length) return { success: false, message: "Belum ada jawaban essay." };
  const pending = rows.filter((r) => r.status !== "dinilai");
  const hasil = [];
  let totalSkor = 0;
  let totalBobot = 0;
  for (const p of pending) {
    const r = await aiNilaiEssayServer(c, String(p.id), String(p.sesiId), String(p.soalId));
    hasil.push({ id: p.id, nama: p.nama, ok: !!(r && r.success), skor: r && r.skor != null ? r.skor : null, feedback: r && r.feedback || r && r.message || "" });
    if (r && r.success && r.skor != null) {
      totalSkor += Number(r.skor);
      totalBobot += Number(p.bobot) || 1;
    }
  }
  const rata = totalBobot > 0 ? Math.round(totalSkor / totalBobot * 100 * 10) / 10 : null;
  return { success: true, total: rows.length, dinilai: hasil.length, hasil, rataEssay: rata };
}
__name(autoNilaiEssayCbtServer, "autoNilaiEssayCbtServer");
async function handleBridge(c) {
  const db = c.env.DB;
  const body = await c.req.json().catch(() => ({}));
  const fn = String(body.fn || "");
  const args2 = Array.isArray(body.args) ? body.args : [];
  const json4 = /* @__PURE__ */ __name((data, status = 200) => new Response(JSON.stringify(data), { status, headers: { "Content-Type": "application/json; charset=utf-8" } }), "json");
  if (fn === "getGeminiKey") {
    return json4({ success: true, data: c.env.GEMINI_KEY || "", message: "OK" });
  }
  const PUBLIC_FNS = /* @__PURE__ */ new Set([
    "validateLogin",
    "register",
    "getGeminiKey",
    "setGeminiKey",
    "getTAInfo",
    "test",
    "runSetup",
    "runSetupGuruV2",
    "runSetupCbt",
    "runSetupBankSoal",
    "logActivity"
  ]);
  if (!PUBLIC_FNS.has(fn)) {
    const gate = await checkUserAccess(c, db);
    if (!gate.ok) return json4(gate.body, gate.status);
  }
  switch (fn) {
    case "aiGuru":
      return json4(await aiGuru(c, String(args2[0] || ""), args2[1] || {}));
    case "aiTextToSoal":
      return json4(await aiTextToSoal(c, String(args2[0] || ""), args2[1] || {}));
    case "aiBuatSoalBank":
      return json4(await aiBuatSoalBank(c, args2[0] || {}));
    case "setGeminiKey":
      return json4({ success: true, message: "Pada Cloudflare Workers, atur secret GEMINI_KEY via `npx wrangler secret put GEMINI_KEY`.", data: "ok" });
    case "generateSummary": {
      const kelas = String(args2[0] || "");
      const type = String(args2[1] || "dashboard");
      const df = String(args2[2] || "");
      const dt = String(args2[3] || "");
      const raw2 = await callAction(c, "GET", "ai-data-summary", { kelas, type, date_from: df, date_to: dt });
      const res = await generateSummary(c, kelas, type, df, dt, raw2.data);
      return json4(res);
    }
    case "parseSearchQuery": {
      const teks = String(args2[0] || "");
      const kelas = String(args2[1] || "");
      const parsed = await parseSearchQuery(c, teks, kelas);
      if (!parsed.success) return json4(parsed);
      const r2 = await callAction(c, "POST", "ai-search-filter", {}, { kelas, table: parsed.parsed.table, filters: parsed.parsed.filters || [], limit: 100 });
      if (!r2.success) return json4({ success: false, message: r2.message || "Gagal menjalankan pencarian." });
      return json4({ success: true, table: parsed.parsed.table, total: r2.data?.total, records: r2.data?.records, query: parsed.parsed });
    }
    case "extractDataEntry":
      return json4(await extractDataEntry(c, String(args2[0] || ""), args2[1] || {}));
    case "aiNilaiEssay":
      return json4(await aiNilaiEssayServer(c, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || "")));
    case "autoNilaiEssayCbt":
      return json4(await autoNilaiEssayCbtServer(c, String(args2[0] || "")));
  }
  const pdfResult = await handlePdf(c, fn, args2);
  if (pdfResult) return json4(pdfResult);
  const spec = FUNCS[fn];
  if (!spec) return json4({ success: false, message: "Fungsi tidak dikenal: " + fn }, 400);
  const a = args2;
  const params = {};
  const qKeys = spec.q || [];
  for (const k of qKeys) {
    const idx = spec.args.indexOf(k);
    const v = idx >= 0 ? a[idx] : void 0;
    if (v !== void 0 && v !== null && v !== "") params[k] = String(v);
  }
  let payload;
  if (typeof spec.body === "function") {
    payload = spec.body(a);
  } else if (spec.body) {
    payload = {};
    for (const k of spec.body) {
      const idx = spec.args.indexOf(k);
      const v = idx >= 0 ? a[idx] : void 0;
      if (v !== void 0) payload[k] = v;
    }
  }
  const r = await callAction(c, spec.method, spec.action, params, payload);
  if (spec.method === "GET") return json4(r.success ? r.data : null);
  if (fn === "validateLogin") {
    if (!r.success) return json4({ success: false, message: r.message || "Login gagal" });
    const data = r.data || {};
    return json4({ success: true, message: r.message, user: data, roles: data.roles });
  }
  return json4({ success: r.success, message: r.message || (r.success ? "OK" : "Gagal"), data: r.data });
}
__name(handleBridge, "handleBridge");
async function handlePdf(c, fn, args2) {
  const db = c.env.DB;
  switch (fn) {
    case "generateRekapNilaiPDF":
      return await generateRekapNilaiPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""));
    case "generateRekapanKelasPDF":
      return await generateRekapanKelasPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""), String(args2[3] || ""));
    case "generateRekapanPDF":
      return await generateRekapanPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""), String(args2[3] || ""), String(args2[4] || ""));
    case "generateRekapMapelPDF":
      return await generateRekapMapelPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""), String(args2[3] || ""), String(args2[4] || ""), String(args2[5] || ""), args2[6]?.guruNama);
    case "generateLaporanAdminPDF":
      return await generateLaporanAdminPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""), String(args2[3] || ""), String(args2[4] || ""));
    case "generateRekapLengkapPDF":
      return await generateRekapLengkapPDF(db, String(args2[0] || ""), String(args2[1] || ""), String(args2[2] || ""), String(args2[3] || ""), String(args2[4] || ""));
    case "generateModulPDF":
      return await generateModulPDF(db, String(args2[0] || ""), String(args2[1] || ""));
    default:
      return null;
  }
}
__name(handlePdf, "handlePdf");

// src/api/webhooks.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var ACTIVE_STATUSES = /* @__PURE__ */ new Set(["settlement", "paid", "success"]);
var ALLOWED_DURATIONS = [30, 180];
function registerWebhooks(app2) {
  app2.post("/api/webhooks/payment", async (c) => {
    const env2 = c.env;
    if (env2.PAYMENT_WEBHOOK_SECRET && c.req.header("x-webhook-secret") !== env2.PAYMENT_WEBHOOK_SECRET) {
      return c.json({ success: false, message: "Unauthorized", code: "UNAUTHORIZED" }, 401);
    }
    const body = await c.req.json().catch(() => ({}));
    const status = s(body.status).toLowerCase();
    if (!ACTIVE_STATUSES.has(status)) {
      return c.json({ success: true, message: "Pending/ignored", data: { ignored: true } });
    }
    const username = s(body.username || body.user_id || body.order_id).trim();
    if (!username) return c.json({ success: false, message: "username/user_id wajib", code: "BAD_REQUEST" }, 400);
    const user = await one(env2.DB, "SELECT id, username, subscription_expires_at FROM users WHERE username=?", [username]);
    if (!user) return c.json({ success: false, message: "User tidak ditemukan", code: "USER_NOT_FOUND" }, 404);
    const dur = ALLOWED_DURATIONS.includes(num(body.duration_days)) ? num(body.duration_days) : 30;
    const now = Date.now();
    const cur = user.subscription_expires_at ? wibEpoch(s(user.subscription_expires_at)) : NaN;
    const base = Number.isFinite(cur) && cur > now ? cur : now;
    const expiresAt = fmtWIB(base + dur * 864e5);
    await run(env2.DB, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
    return c.json({
      success: true,
      message: "Langganan diperbarui",
      data: { username: user.username, planType: "premium", subscriptionExpiresAt: expiresAt, durationDays: dur }
    });
  });
}
__name(registerWebhooks, "registerWebhooks");

// src/api/register.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
function genUniqueId2() {
  const now = /* @__PURE__ */ new Date();
  const ym = String(now.getFullYear()).slice(2) + String(now.getMonth() + 1).padStart(2, "0");
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  let r = "";
  const rnd = new Uint8Array(4);
  crypto.getRandomValues(rnd);
  for (let i = 0; i < 4; i++) r += chars[rnd[i] % chars.length];
  return `GRU-${ym}-${r}`;
}
__name(genUniqueId2, "genUniqueId");
var PLAN_PRICES = {
  wali_kelas: 5e4,
  guru_mapel: 35e3,
  walikelas_guru: 75e3
};
var PLAN_ROLE = {
  wali_kelas: "Walikelas",
  guru_mapel: "Guru",
  walikelas_guru: "Walikelas"
  // wali kelas + guru → role Walikelas (auto Guru via NIP)
};
var ALLOWED_PLANS = new Set(Object.keys(PLAN_PRICES));
var ALLOWED_DURATIONS2 = [30, 180];
function json2(v, status = 200) {
  return new Response(JSON.stringify(v), {
    status,
    headers: { "Content-Type": "application/json; charset=utf-8" }
  });
}
__name(json2, "json");
function fail2(message, status = 400) {
  return json2({ success: false, message }, status);
}
__name(fail2, "fail");
function registerRegisterAndPay(app2) {
  app2.post("/api/register-and-pay", async (c) => {
    const env2 = c.env;
    const db = env2.DB;
    const body = await c.req.json().catch(() => ({}));
    const nama = String(body.nama || "").trim();
    const username = String(body.username || "").trim();
    const password = String(body.password || "");
    const email = String(body.email || "").trim().toLowerCase();
    const plan = String(body.plan || "").trim();
    if (!nama || !username || !password) return fail2("nama, username, password wajib diisi");
    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return fail2("Email tidak valid");
    if (!ALLOWED_PLANS.has(plan)) return fail2("plan tidak valid. Pilih wali_kelas | guru_mapel | walikelas_guru");
    const dup = await one(db, "SELECT id FROM users WHERE username=?", [username]);
    if (dup) return fail2("Username sudah dipakai");
    const role = PLAN_ROLE[plan];
    const amount = PLAN_PRICES[plan];
    const durationDays = ALLOWED_DURATIONS2.includes(Number(body.duration_days)) ? Number(body.duration_days) : 30;
    const trialEndsAt = fmtWIB(Date.now() + 30 * 24 * 3600 * 1e3);
    const uniqueId = genUniqueId2();
    const hash = await hashPassword(password);
    const userId = await insertId(
      db,
      "INSERT INTO users (username,password,role,kelas,nama_lengkap,nip,email,unique_id,plan_type,trial_ends_at) VALUES (?,?,?,?,?,?,?,?,?,?)",
      [username, hash, role, "", nama, "", email || null, uniqueId, "trial", trialEndsAt]
    );
    if (!userId) return fail2("Gagal membuat user. Coba lagi.");
    const paymentId = await insertId(
      db,
      "INSERT INTO payments (user_id, amount, proof_image_url, status, role_plan, duration_days, created_at) VALUES (?,?,?,?,?,?,?)",
      [userId, amount, null, "pending", plan, durationDays, nowWIB()]
    );
    let adminWa = String(env2.ADMIN_WA || "").replace(/\D/g, "");
    if (adminWa.length < 10) adminWa = "628XXXXXXXXXX";
    const msg = "Halo Admin, saya " + nama + " (" + username + ") baru saja mendaftar langganan " + planLabel(plan) + ". Ini ID Pembayaran saya: " + paymentId + ". Mohon segera dicek dan diaktifkan ya.";
    const whatsappUrl = "https://wa.me/" + adminWa + "?text=" + encodeURIComponent(msg);
    return json2({
      status: "success",
      message: "Pendaftaran berhasil. Silakan konfirmasi via WhatsApp.",
      payment_id: paymentId,
      whatsapp_url: whatsappUrl,
      plan,
      amount,
      unique_id: uniqueId,
      trial_ends_at: trialEndsAt
    });
  });
  app2.get(
    "/api/plans",
    (c) => json2({
      success: true,
      data: {
        plans: Object.entries(PLAN_PRICES).map(([id, price]) => ({ id, price, role: PLAN_ROLE[id], label: planLabel(id) })),
        currency: "IDR"
      }
    })
  );
}
__name(registerRegisterAndPay, "registerRegisterAndPay");
function planLabel(plan) {
  const labels = {
    wali_kelas: "Wali Kelas",
    guru_mapel: "Guru Mapel",
    walikelas_guru: "Wali Kelas + Guru Mapel"
  };
  return labels[plan] || plan;
}
__name(planLabel, "planLabel");

// src/api/admin.ts
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_process();
init_virtual_unenv_global_polyfill_cloudflare_unenv_preset_node_console();
init_performance2();
var ALLOWED_DURATIONS3 = [30, 180];
function nextExpiry(user, dur) {
  const now = Date.now();
  const cur = user && s(user.subscription_expires_at) ? wibEpoch(s(user.subscription_expires_at)) : NaN;
  const base = Number.isFinite(cur) && cur > now ? cur : now;
  return fmtWIB(base + dur * 864e5);
}
__name(nextExpiry, "nextExpiry");
var USER_FIELDS = "id, username, role, kelas, nama_lengkap AS namaLengkap, nip, email, unique_id AS uniqueId, plan_type AS planType, trial_ends_at AS trialEndsAt, subscription_expires_at AS subscriptionExpiresAt";
function planState(u) {
  const plan = s(u.planType || "free");
  const now = Date.now();
  if (plan === "premium") {
    const exp = u.subscriptionExpiresAt ? wibEpoch(s(u.subscriptionExpiresAt)) : NaN;
    return { plan, expired: !u.subscriptionExpiresAt || now > exp };
  }
  if (plan === "trial") {
    const exp = u.trialEndsAt ? wibEpoch(s(u.trialEndsAt)) : NaN;
    return { plan, expired: !u.trialEndsAt || now > exp };
  }
  return { plan, expired: false };
}
__name(planState, "planState");
function json3(v, status = 200) {
  return new Response(JSON.stringify(v), {
    status,
    headers: { "Content-Type": "application/json; charset=utf-8" }
  });
}
__name(json3, "json");
function fail3(message, status = 400) {
  return json3({ success: false, message }, status);
}
__name(fail3, "fail");
function registerAdmin(app2) {
  app2.get("/users", async (c) => {
    const db = c.env.DB;
    const filter = s(c.req.query("filter"));
    const search = s(c.req.query("search"));
    let rows;
    if (search) {
      const like = "%" + search.replace(/%/g, "\\%").replace(/_/g, "\\_") + "%";
      rows = await all(
        db,
        "SELECT " + USER_FIELDS + " FROM users WHERE (nama_lengkap LIKE ? ESCAPE '\\' OR email LIKE ? ESCAPE '\\' OR unique_id LIKE ? ESCAPE '\\') ORDER BY id DESC LIMIT 500",
        [like, like, like]
      );
    } else {
      rows = await all(db, "SELECT " + USER_FIELDS + " FROM users ORDER BY id DESC LIMIT 500");
    }
    if (filter) {
      const match2 = /* @__PURE__ */ __name((u) => {
        const st = planState(u);
        if (filter === "trial") return st.plan === "trial";
        if (filter === "premium") return st.plan === "premium" && !st.expired;
        if (filter === "expired") return st.expired || st.plan === "free";
        if (filter === "free") return st.plan === "free";
        return true;
      }, "match");
      rows = rows.filter(match2);
    }
    const data = rows.map((u) => {
      const st = planState(u);
      return { ...u, planState: st.plan, expired: st.expired };
    });
    return json3({ success: true, data });
  });
  app2.get("/stats", async (c) => {
    const db = c.env.DB;
    const [totalUser, activeUser, pendingPay, monthRevenue] = await Promise.all([
      one(db, "SELECT COUNT(*) AS c FROM users"),
      one(db, "SELECT COUNT(*) AS c FROM users WHERE plan_type='premium' AND subscription_expires_at > ?", [nowWIB()]),
      one(db, "SELECT COUNT(*) AS c FROM payments WHERE status='pending'"),
      one(db, "SELECT COALESCE(SUM(amount),0) AS s FROM payments WHERE status='approved' AND substr(created_at,1,7)=?", [String(nowWIB()).slice(0, 7)])
    ]);
    return json3({
      success: true,
      data: {
        totalUsers: num(totalUser?.c),
        activeUsers: num(activeUser?.c),
        pendingPayments: num(pendingPay?.c),
        monthRevenue: num(monthRevenue?.s)
      }
    });
  });
  app2.delete("/users/:id", async (c) => {
    const db = c.env.DB;
    const id = num(c.req.param("id"));
    const user = await one(db, "SELECT id, username FROM users WHERE id=?", [id]);
    if (!user) return fail3("User tidak ditemukan", 404);
    if (String(user.username) === String(c.get("user")?.username)) return fail3("Tidak bisa menghapus diri sendiri", 400);
    await run(db, "DELETE FROM payments WHERE user_id=?", [id]);
    await run(db, "DELETE FROM users WHERE id=?", [id]);
    return json3({ success: true, message: "User " + user.username + " dihapus", data: { id } });
  });
  app2.get("/payments", async (c) => {
    const db = c.env.DB;
    const status = s(c.req.query("status") || "pending");
    const rows = await all(
      db,
      `SELECT p.id, p.user_id AS userId, p.amount, p.proof_image_url AS proofImageUrl, p.status,
              p.role_plan AS rolePlan, p.duration_days AS durationDays, p.created_at AS createdAt,
              u.username, u.nama_lengkap AS namaLengkap, u.kelas, u.plan_type AS planType
       FROM payments p JOIN users u ON u.id = p.user_id
       WHERE p.status = ? ORDER BY p.id DESC LIMIT 200`,
      [status]
    );
    return json3({ success: true, data: rows });
  });
  app2.post("/payments/:id/approve", async (c) => {
    const db = c.env.DB;
    const id = num(c.req.param("id"));
    const pay = await one(db, "SELECT * FROM payments WHERE id=?", [id]);
    if (!pay) return fail3("Payment tidak ditemukan", 404);
    if (pay.status === "approved") return fail3("Payment sudah di-approve sebelumnya", 409);
    const user = await one(db, "SELECT id, username, subscription_expires_at FROM users WHERE id=?", [pay.user_id]);
    if (!user) return fail3("User terkait tidak ditemukan", 404);
    const dur = ALLOWED_DURATIONS3.includes(num(c.req.query("duration_days") || pay.duration_days)) ? num(c.req.query("duration_days") || pay.duration_days) : 30;
    const expiresAt = nextExpiry(user, dur);
    await run(db, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
    await run(db, "UPDATE payments SET status='approved' WHERE id=?", [id]);
    return json3({
      success: true,
      message: "Pembayaran disetujui. " + user.username + " \u2192 premium s/d " + expiresAt,
      data: { paymentId: id, username: user.username, expiresAt, durationDays: dur }
    });
  });
  app2.post("/payments/:id/reject", async (c) => {
    const db = c.env.DB;
    const id = num(c.req.param("id"));
    const pay = await one(db, "SELECT id, status FROM payments WHERE id=?", [id]);
    if (!pay) return fail3("Payment tidak ditemukan", 404);
    await run(db, "UPDATE payments SET status='rejected' WHERE id=?", [id]);
    return json3({ success: true, message: "Pembayaran ditolak", data: { paymentId: id } });
  });
  app2.put("/users/:id/upgrade", async (c) => {
    const db = c.env.DB;
    const id = num(c.req.param("id"));
    const user = await one(db, "SELECT id, username, subscription_expires_at FROM users WHERE id=?", [id]);
    if (!user) return fail3("User tidak ditemukan", 404);
    let body = {};
    try {
      body = await c.req.json();
    } catch {
    }
    const plan = s(body.plan_type) || "premium";
    const dur = ALLOWED_DURATIONS3.includes(num(body.duration_days)) ? num(body.duration_days) : 30;
    if (plan === "premium") {
      const expiresAt = nextExpiry(user, dur);
      await run(db, "UPDATE users SET plan_type='premium', subscription_expires_at=?, trial_ends_at=NULL WHERE id=?", [expiresAt, user.id]);
      return json3({ success: true, message: user.username + " \u2192 premium s/d " + expiresAt, data: { expiresAt, durationDays: dur } });
    }
    if (plan === "trial") {
      const trialDays = num(body.trial_days) || 7;
      const trialEndsAt = fmtWIB(Date.now() + trialDays * 864e5);
      await run(db, "UPDATE users SET plan_type='trial', trial_ends_at=?, subscription_expires_at=NULL WHERE id=?", [trialEndsAt, user.id]);
      return json3({ success: true, message: user.username + " \u2192 trial s/d " + trialEndsAt, data: { trialEndsAt } });
    }
    await run(db, "UPDATE users SET plan_type='free', trial_ends_at=NULL, subscription_expires_at=NULL WHERE id=?", [id]);
    return json3({ success: true, message: user.username + " \u2192 free", data: {} });
  });
}
__name(registerAdmin, "registerAdmin");

// src/app.ts
var app = new Hono2();
app.onError((err2, c) => {
  console.error("[hono-error]", err2 && err2.stack ? err2.stack : String(err2));
  return new Response(JSON.stringify({ success: false, message: "Error: " + (err2 instanceof Error ? err2.message : String(err2)) }), {
    status: 500,
    headers: { "Content-Type": "application/json; charset=utf-8" }
  });
});
app.use("*", async (c, next) => {
  const env2 = c.env;
  env2.__app = app;
  if (!env2.self) {
    env2.self = {
      fetch: /* @__PURE__ */ __name(async (input, init) => {
        const url = typeof input === "string" ? new URL(input) : input instanceof URL ? input : new URL(input.url);
        const base = new URL(c.req.url);
        const target = new URL(url.pathname + url.search, base.origin);
        const fetchFn = app.fetch;
        return fetchFn(new Request(target.toString(), init), c.env, c.executionCtx);
      }, "fetch")
    };
  }
  await next();
});
registerRegisterAndPay(app);
await registerRoutes(app);
var protectedApp = new Hono2();
protectedApp.use("*", requireActiveSubscription);
protectedApp.get("/me", async (c) => {
  const u = c.get("user");
  return c.json({ success: true, data: u, message: "OK" });
});
app.route("/api/app", protectedApp);
var adminApp = new Hono2();
adminApp.use("*", requireSuperAdmin);
registerAdmin(adminApp);
app.route("/api/admin", adminApp);
registerWebhooks(app);
app.post("/__gas", async (c) => handleBridge(c));
app.all("*", async (c) => {
  const env2 = c.env;
  if (env2.ASSETS && typeof env2.ASSETS.fetch === "function") {
    const url = new URL(c.req.url);
    if (url.pathname === "/" || url.pathname === "/index.html") {
      url.pathname = "/index.html";
      const r3 = await env2.ASSETS.fetch(url.toString(), c.req.raw);
      if (r3.ok) return new Response(r3.body, r3);
    }
    if (url.pathname === "/langganan" || url.pathname === "/langganan.html") {
      url.pathname = "/langganan.html";
      const r3 = await env2.ASSETS.fetch(url.toString(), c.req.raw);
      if (r3.ok) return new Response(r3.body, r3);
    }
    const r = await env2.ASSETS.fetch(c.req.url, c.req.raw);
    if (r.ok) return r;
    const idx = new URL("/index.html", c.req.url);
    const r2 = await env2.ASSETS.fetch(idx.toString(), c.req.raw);
    if (r2.ok) return new Response(r2.body, r2);
  }
  return new Response("Not Found", { status: 404 });
});

// src/index.ts
var index_default = app;
var scheduled = /* @__PURE__ */ __name(async (event, env2, ctx) => {
  try {
    const req = new Request("https://internal/api?action=cbt-cleanup-expired", { method: "POST", headers: { "Content-Type": "application/json" } });
    const fetchFn = app.fetch;
    const res = await fetchFn(req, env2, ctx);
    if (!res.ok) console.error("cbt-cleanup-expired cron failed:", res.status);
  } catch (e) {
    console.error("cbt-cleanup-expired cron error:", e);
  }
}, "scheduled");
export {
  index_default as default,
  scheduled
};
/*! Bundled license information:

bcryptjs/dist/bcrypt.js:
  (**
   * @license bcrypt.js (c) 2013 Daniel Wirtz <dcode@dcode.io>
   * Released under the Apache License, Version 2.0
   * see: https://github.com/dcodeIO/bcrypt.js for details
   *)
*/
//# sourceMappingURL=index.js.map
