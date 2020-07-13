import strutils, sequtils

proc toRna*(code: string): string =

  proc transcode(ch: char): char =
    case ch
    of 'G': return 'C'
    of 'C': return 'G'
    of 'T': return 'A'
    of 'A': return 'U'
    else: raise newException(ValueError, "Not a valid nucleotide")

  @code.mapIt(transcode(it)).join()
