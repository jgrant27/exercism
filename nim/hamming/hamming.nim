import sequtils

func distance*(str1: string, str2: string): int =
  if str1.len == 0 and str2.len == 0:
    0
  elif str1.len == str2.len:
    foldl(mapIt(zip(@str1, @str2), if it[0] == it[1]: 0 else: 1), a + b)
  else:
    raise newException(ValueError, "lengths are unequal")
