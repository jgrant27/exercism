module Roman

  NUMS = [
    # Ones
    {0 => "",
     1 => "I",
     2 => "II",
     3 => "III",
     4 => "IV",
     5 => "V",
     6 => "VI",
     7 => "VII",
     8 => "VIII",
     9 => "IX"},
    # Tens
    {0 => "",
     1 => "X",
     2 => "XX",
     3 => "XXX",
     4 => "XL",
     5 => "L",
     6 => "LX",
     7 => "LXX",
     8 => "LXXX",
     9 => "XC"},
    # Hundreds
    {0 => "",
     1 => "C",
     2 => "CC",
     3 => "CCC",
     4 => "CD",
     5 => "D",
     6 => "DC",
     7 => "DCC",
     8 => "DCCC",
     9 => "CM"},
    # Thousands
    {1 => "M",
     2 => "MM",
     3 => "MMM"} ]

end

struct Int

  def to_roman()
    self.to_s.each_char.to_a.reverse
      .reduce({"", 0}) { |a, c| {Roman::NUMS[a[1]][c.to_i] + a[0], a[1]+1} }[0]
  end

end
