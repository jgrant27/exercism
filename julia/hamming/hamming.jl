function distance(s1::AbstractString, s2::AbstractString) ::Int
    isempty(s1) || isempty(s2) || length(s1)!=length(s2) &&
        throw(ArgumentError("Strands s1($(length(s1))) and s2($(length(s2))) " *
                            "must be same length and not empty."))
    filter(p -> ((a, b) = p;  a != b), collect(zip(s1, s2))) |> length
end

@assert 2 == distance("GAT", "AGT")
@assert 7 == distance("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT")
