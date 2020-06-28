import strutils, sequtils

func hey*(thing: string): string =
  if isEmptyOrWhiteSpace(thing):
    return "Fine. Be that way!"
  let sthing = thing.strip()
  let question = len(deduplicate(@sthing)) > 1 and sthing.endsWith("?")
  let yelling = sthing.any(isAlphaAscii) and
                sthing.allIt(not it.isAlphaAscii() or
                             it.isUpperAscii())
  if question and yelling:
    return "Calm down, I know what I'm doing!"
  if question:
    return "Sure."
  if yelling:
    return "Whoa, chill out!"
  return "Whatever."
