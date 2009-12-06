import deadlogger/[Logger, Level, Handler]

Formatter: abstract class {
    format: abstract func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> String
}

NiceFormatter: class extends Formatter {
    format: func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> String {
        return "[%s] [%s] %s" format(Level format(level), emitter path, msg)
    }
}
