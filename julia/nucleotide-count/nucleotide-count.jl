function count_nucleotide(dict, ch)
    ch in keys(dict) || throw(DomainError("Invalid Nucleotide! $(ch)"))
    dict[ch] += 1
    dict
end

function count_nucleotides(strand::AbstractString)
    reduce(count_nucleotide, strand,
           init=Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0))
end
