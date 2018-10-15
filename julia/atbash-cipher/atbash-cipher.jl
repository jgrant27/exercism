function atbash_char(ch)
    isletter(ch) ? Char(Int('a')+Int('z')-Int(ch)) : ch
end

function encode(input::AbstractString)
    cinput = replace(lowercase(input), r"[^a-z0-9]" => "")
    reduce(((s, n), ch) ->
            (s * (0 == n % 5 ? " " : "") * atbash_char(ch), n+1),
            cinput, init=("", 0)) |> first |> strip
end

function decode(input::AbstractString)
    filter(c -> isletter(c) || isdigit(c),
           map(ch -> atbash_char(ch), lowercase(input)))
end
