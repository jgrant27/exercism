import strutils

func encode*(text: string): string =
  if 0 == len(text): return

  var (last_count, last_char) = (0, text[0])

  proc add_char(res: var string) =
    if last_count > 1: res &= last_count
    res &= last_char
    last_count = 0

  for i, ch in text:
    if i != 0: last_count += 1
    if ch != last_char: add_char(result)
    last_char = ch
  last_count += 1
  add_char(result)

func decode*(text: string): string =
  if 0 == len(text): return

  var num_str = ""
  for i in 0..text.high:
    let ch = text[i]
    if ch.isDigit:
      num_str &= ch
    else:
      let times = if len(num_str) > 0: parseInt(num_str)
                  else: 1
      num_str = ""
      result &= ch.repeat(times)
