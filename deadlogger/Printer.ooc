import deadlogger/[Logger, Level]

Printer: abstract class {
    print: abstract func (level: Int, emitter: Logger, msg: String) -> Bool
}

FilterPrinter: class extends Printer {
    levelRange: Range
    printer: Printer

    init: func (=levelRange, =printer) {}

    print: func (level: Int, emitter: Logger, msg: String) -> Bool {
        if(level >= levelRange min && level < levelRange max) {
            return printer print(level, emitter, msg)
        } else {
            return false
        }
    }
}

PrintPrinter: class extends Printer {
    print: func (level: Int, emitter: Logger, msg: String) -> Bool {
        "[%s] [%s] %s" format(Level format(level), emitter path, msg) println()
        return true
    }
}
