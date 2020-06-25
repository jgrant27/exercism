import sequtils, strutils

func isIsogram*(str: string): bool =
  let fstr = toUpper(str).filterIt it in {'A'..'Z'}
  len(fstr.deduplicate()) == len(fstr)
