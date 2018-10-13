function to_rna(dna::AbstractString)
    d = Dict('G'=>'C', 'C'=>'G', 'T'=>'A', 'A'=>'U')
    all(c -> c in keys(d), dna) || throw(ErrorException("Invalid DNA"))
    map(c -> d[c], dna)
end
