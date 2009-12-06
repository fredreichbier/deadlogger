import deadlogger/[Log, Handler, Level, Formatter, Filter]

main: func {
    handler := StreamHandler new(stdout)
    handler setFormatter(ColoredFormatter new(NiceFormatter new()))
    Log root attachHandler(handler)
    logger := Log getLogger("main")
    logger debug("debug")
    logger info("info")
    logger warn("warn")
    logger error("error")
    logger critical("critical")
    logger log(1234, "nothing!")
}
