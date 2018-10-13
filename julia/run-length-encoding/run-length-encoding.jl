function encode(s)
    function f((s, n, pc), c)
        pc==c || pc=='\00' ? (s, n+1, c) :
            (n>1 ? s*string(n)*pc : s*pc, 1, c)
    end
    first(reduce(f, s*'\00', init=("", 0, '\00')))
end


function decode(s)
    function f((rs, ns), c)
        isdigit(c) ? (rs, ns * c) :
            !isempty(ns) ? (rs * (c ^ parse(Int, ns)), "") :
            (rs * c, "")
    end
    first(reduce(f, s, init=("", "")))
end
