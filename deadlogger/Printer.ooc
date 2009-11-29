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

ColorPrintPrinter: class extends Printer {
    print: func (level: Int, emitter: Logger, msg: String) -> Bool {
        color: String = match level {
            case Level debug => "36"
            case Level info => "32"
            case Level warn => "33"
            case Level error => "35"
            case Level critical => "31"
            case => null
        }
        if(color) {
            "\033[0;%sm" format(color) print()
        }
        "[%s] [%s] %s" format(Level format(level), emitter path, msg) print()
        if(color) {
            "\033[0m" print()
        }
        printf("\n")
        return true
    }
}