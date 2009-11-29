Level: class {
    debug: static Int = 0
    info: static Int = 1
    warn: static Int = 2
    error: static Int = 3
    critical: static Int = 4

    format: static func (level: Int) -> String {
        return match level {
            case debug => "DEBUG"
            case info => "INFO"
            case warn => "WARN"
            case error => "ERROR"
            case critical => "CRITICAL"
            case => level toString()
        }
    }
}
