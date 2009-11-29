import deadlogger/[Log, Printer, Level]

main: func {
    Log root attachPrinter(ColorPrintPrinter new())
    logger := Log getLogger("main")
    logger debug("debug")
    logger info("info")
    logger warn("warn")
    logger error("error")
    logger critical("critical")
    logger log(1234, "nothing!")
}
