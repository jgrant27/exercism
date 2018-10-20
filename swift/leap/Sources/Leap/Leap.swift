struct Year {

    let isLeapYear: Bool

    init(calendarYear: Int) {
        self.isLeapYear = 0 == calendarYear % 4 &&
          (0 != calendarYear % 100 || 0 == calendarYear % 400)
    }

}
