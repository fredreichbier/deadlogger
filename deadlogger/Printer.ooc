import os/Terminal
import deadlogger/[Logger, Level]

Printer: abstract class {
    print: abstract func (logger: Logger, level: Int, emitter: Logger, msg, formatted: String)
}

PrintPrinter: class extends Printer {
    print: func (logger: Logger, level: Int, emitter: Logger, msg, formatted: String) {
        formatted println()
    }
}

ColorPrintPrinter: class extends Printer {
    print: func (logger: Logger, level: Int, emitter: Logger, msg, formatted: String) {
        color: Int = match level {
            case Level debug => 36
            case Level info => 32
            case Level warn => 33
            case Level error => 35
            case Level critical => 31
            case => 0
        }
        if(color) {
            Terminal setFgColor(color)
        }
        formatted print()
        if(color) {
            Terminal reset()
        }
        printf("\n")
    }
}
