import deadlogger/Logger

Log: class {
    root := static Logger new("")

    getLogger: static func (path: String) -> Logger {
        if(path == "") {
            return root
        } else {
            return root getSubLogger(path)
        }
    }
}
