import deadlogger/[Log, Printer, Level]

main: func {
    Log root attachPrinter(FilterPrinter new(1..2, PrintPrinter new()))
    logger := Log getLogger("main")
    logger debug("KALAMAZOO")
    logger info("Serious information!")
}
