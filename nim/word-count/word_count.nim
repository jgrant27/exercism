import tables, strutils, sequtils

const SPLIT_CHARS = {',', '\n', ' '}
const SINGLE_QUOTE = '\''

proc countWords*(sentence: string): TableRef[string, int] =
  var table = newTable[string, int]()
  for word in sentence.toLowerAscii().split(SPLIT_CHARS):
    var sword = word.filterIt(it in 'a'..'z' or
                              it in '0'..'9' or
                              it == SINGLE_QUOTE).join()
    if len(sword) > 0:
      if sword[0] == SINGLE_QUOTE and sword[len(sword)-1] == SINGLE_QUOTE:
        sword = sword[1..len(sword)-2].strip(chars = {SINGLE_QUOTE})
      if table.contains(sword):
        table[sword] += 1
      else:
        table[sword] = 1
  table
