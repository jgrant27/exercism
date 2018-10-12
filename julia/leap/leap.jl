function is_leap_year(year::Int)

    0 == year % 4 && (0 != year % 100 || 0 == year % 400)

end
