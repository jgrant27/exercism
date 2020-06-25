import sequtils

func distance*(str1: string, str2: string): int =
  if len(str1) != len(str2):
    raise newException(ValueError, "lengths are unequal")
  else:
    zip(@str1, @str2).mapIt(it[0] == it[1]).count(false)
