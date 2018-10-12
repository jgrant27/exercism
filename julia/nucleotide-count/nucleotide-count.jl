function count_nucleotide(dict, ch)
    if !issubset(ch, keys(dict)) throw(DomainError("Invalid Nucleotide!")) end
    dict[ch] += 1
    dict
end

function count_nucleotides(strand::AbstractString)
    res = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    if !isempty(strand) reduce(count_nucleotide, strand, init=res) end
    res
end
