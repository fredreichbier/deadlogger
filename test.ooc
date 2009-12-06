import deadlogger/[Log, Printer, Level, Formatter]

main: func {
    Log root attachPrinter(ColorPrintPrinter new())
    logger := Log getLogger("main")
    Log root setFormatter(NiceFormatter new())
    logger debug("debug")
    logger info("info")
    logger warn("warn")
    logger error("error")
    logger critical("critical")
    logger log(1234, "nothing!")
}
