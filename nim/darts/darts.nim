import math

func score*(t: (float, float)): int =
  case sqrt(t[0] ^ 2 + t[1] ^ 2)
  of 0..1:
    10
  of 1..5:
    5
  of 5..10:
    1
  else:
    0
