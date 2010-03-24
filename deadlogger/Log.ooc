import deadlogger/Logger

Log: class {
    root := static Logger new("")

    getLogger: static func (path: String) -> Logger {
        if(path == "") {
            return This root
        } else {
            return This root getSubLogger(path)
        }
    }
}
