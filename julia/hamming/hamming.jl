function distance(s1::AbstractString, s2::AbstractString) ::Int
    if length(s1)!=length(s2)
        throw(ArgumentError("Strands s1($(length(s1))) and s2($(length(s2))) " *
                            "must be same length"))
    end
    reduce((acc, (a, b)) -> if a!=b acc+1 else acc end, zip(s1, s2), init=0)
end

@assert 2 == distance("GAT", "AGT")
@assert 7 == distance("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT")
