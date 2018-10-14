function ispangram(input::AbstractString)
    26 == filter(isletter, input) |> Set |> length
end
