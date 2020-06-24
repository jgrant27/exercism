import strformat

proc twoFer*(name: string = "you"): string =
  result = &"One for {name}, one for me."
