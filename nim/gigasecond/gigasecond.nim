import times, math

proc addGigasecond*(start: DateTime): DateTime =
  start + (10 ^ 9).seconds
