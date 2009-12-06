import deadlogger/[Log, Printer, Level, Formatter, Filter]

main: func {
    Log root attachPrinter(ColorPrintPrinter new())
    logger := Log getLogger("main")
    Log root setFormatter(NiceFormatter new())
    Log root setFilter(LevelFilter new(1..2))
    logger debug("debug")
    logger info("info")
    logger warn("warn")
    logger error("error")
    logger critical("critical")
    logger log(1234, "nothing!")
}
