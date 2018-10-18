struct Year {

    var isLeapYear = false

    init(calendarYear: Int) {
        self.isLeapYear = 0 == calendarYear % 4 &&
          (0 != calendarYear % 100 || 0 == calendarYear % 400)
    }

}
