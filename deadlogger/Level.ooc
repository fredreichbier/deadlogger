Level: class {
    debug: static Int = 0
    info: static Int = 1
    warn: static Int = 2
    error: static Int = 3
    critical: static Int = 4

    format: static func (level: Int) -> String {
        return match level {
            case This debug => "DEBUG"
            case This info => "INFO"
            case This warn => "WARN"
            case This error => "ERROR"
            case This critical => "CRITICAL"
            case => level toString()
        }
    }
}
