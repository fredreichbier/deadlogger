import deadlogger/Logger

Filter: abstract class {
    isAccepted: abstract func (logger: Logger, level: Int, emitter: Logger, msg: String) -> Bool
}

LevelFilter: class extends Filter {
    range: Range
    
    init: func (=range) {}

    isAccepted: func (logger: Logger, level: Int, emitter: Logger, msg: String) -> Bool {
        return level >= range min && level < range max
    }
}
