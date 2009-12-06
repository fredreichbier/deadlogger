import deadlogger/[Logger, Handler]

Filter: abstract class {
    isAccepted: abstract func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> Bool
}

LevelFilter: class extends Filter {
    range: Range
    
    init: func (=range) {}

    isAccepted: func (handler: Handler, logger: Logger, level: Int, emitter: Logger, msg: String) -> Bool {
        return level >= range min && level < range max
    }
}
