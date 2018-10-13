function bob(stimulus::AbstractString)
    function all_uppercase_not_empty(str)
        !isempty(str) && all(isuppercase, str)
    end

    stimulus = strip(stimulus)
    chars_only = replace(stimulus, r"[^a-zA-Z]" => "")
    if isempty(stimulus)
        "Fine. Be that way!"
    elseif '?' == stimulus[end]
        if all_uppercase_not_empty(chars_only)
            "Calm down, I know what I'm doing!"
        else
            "Sure."
        end
    elseif all_uppercase_not_empty(chars_only)
        "Whoa, chill out!"
    else
        "Whatever."
    end
end
