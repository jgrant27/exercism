import sequtils, math

func sumOfSquares*(n: int): uint64 =
  uint64((1..n).mapIt(it ^ 2).sum())

func squareOfSum*(n: int): uint64 =
  uint64((1..n).toSeq().sum()) ^ 2

func difference*(n: int): uint64 =
  squareOfSum(n) - sumOfsquares(n)
