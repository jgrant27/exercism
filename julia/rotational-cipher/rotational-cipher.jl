function rotate_char(n::Int, ch::Char)
    if !isletter(ch) ch
    else sc = Int(islowercase(ch) ? 'a' : 'A')
        Char(sc + ((Int(ch) - sc + n) % 26)) end end

function rotate(n::Int, ch::Char) rotate_char(n, ch) end
function rotate(n::Int, s::String) map(ch -> rotate_char(n, ch), s) end
