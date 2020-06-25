import sequtils, strutils

func abbreviate*(s: string): string =
  s.toUpper.split({' ', '-', '_'})
  .filterIt(len(it) > 0).mapIt(it[0]).join
