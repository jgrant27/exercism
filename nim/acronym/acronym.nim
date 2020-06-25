import sequtils, strutils

func abbreviate*(s: string): string =
  s.toUpper.split({' ', '-'})
  .mapIt(it.filterIt it in {'A'..'Z'})
  .filterIt(len(it) > 0).mapIt(it[0]).join
