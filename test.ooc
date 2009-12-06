import deadlogger/[Log, Handler, Level, Formatter, Filter]

main: func {
    /* console handler */
    console := StdoutHandler new()
    console setFormatter(ColoredFormatter new(NiceFormatter new()))
    Log root attachHandler(console)
    /* file handler */
    file := FileHandler new("test.log")
    file setFormatter(NiceFormatter new("{{level}}: {{msg}}"))
    Log root attachHandler(file)
    /* test */
    logger := Log getLogger("main")
    logger debug("debug")
    logger info("info")
    logger warn("warn")
    logger error("error")
    logger critical("critical")
    logger log(1234, "nothing!")
}
