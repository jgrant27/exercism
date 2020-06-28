import sequtils

func is_triangle(lens: array[0..2, int]): bool =
  lens.allIt(it > 0) and
  lens[0] + lens[1] >= lens[2] and
  lens[1] + lens[2] >= lens[0] and
  lens[0] + lens[2] >= lens[1]

func isEquilateral*(lens: array[0..2, int]): bool =
  is_triangle(lens) and lens.deduplicate.len == 1

func isIsosceles*(lens: array[0..2, int]): bool =
  is_triangle(lens) and lens.deduplicate.len <= 2

func isScalene*(lens: array[0..2, int]): bool =
  is_triangle(lens) and lens.deduplicate.len == 3
