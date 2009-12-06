import deadlogger/Logger

Filter: abstract class {
    isAccepted: abstract func (logger: Logger, level: Int, emitter: Logger, msg: String) -> Bool
}
