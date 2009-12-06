import deadlogger/[Logger, Level]

Formatter: abstract class {
    format: abstract func (logger: Logger, level: Int, emitter: Logger, msg: String) -> String
}

NiceFormatter: class extends Formatter {
    format: func (logger: Logger, level: Int, emitter: Logger, msg: String) -> String {
        return "[%s] [%s] %s" format(Level format(level), emitter path, msg)
    }
}
