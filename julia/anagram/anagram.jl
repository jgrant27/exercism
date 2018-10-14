function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
    hash = sort ∘ collect ∘ lowercase
    filter(candidates) do word
        hash(word) == hash(subject) && lowercase(word) != lowercase(subject)
    end
end
