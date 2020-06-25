func isLeapYear*(year: int): bool =
  0 == year mod 4 and 0 != year mod 100 or 0 == year mod 400
