proc reverse*(str: string): string =
  for c in str: result = c & result
