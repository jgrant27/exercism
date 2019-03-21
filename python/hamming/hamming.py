def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands are not the same length.")
    return sum(map(lambda p: p[0] != p[1], zip(strand_a, strand_b)))
