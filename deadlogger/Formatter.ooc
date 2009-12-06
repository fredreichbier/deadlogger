import text/StringBuffer
import deadlogger/[Logger, Level, Handler]

Formatter: abstract class {
    format: abstract func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> String
}

NiceFormatter: class extends Formatter {
    format: func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> String {
        return "[%s] [%s] %s" format(Level format(level), emitter path, msg)
    }
}

ColoredFormatter: class extends Formatter {
    inner: Formatter
    init: func (=inner) {}

    format: func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> String {
        color: Int = match level {
            case Level debug => 36
            case Level info => 32
            case Level warn => 33
            case Level error => 35
            case Level critical => 31
            case => 0
        }
        buffer := StringBuffer new()
        if(color) {
            buffer append("\033[%dm" format(color)) /* I'd REALLY like to use os/Terminal here, but it can only print */
        }
        buffer append(inner format(handler, logger, level, emitter, msg))
        if(color) {
            buffer append("\033[0m")
        }
        return buffer toString()
    }
}
