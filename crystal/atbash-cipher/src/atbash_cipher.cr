module Atbash

  def self.encode(s)
    alphabet = "abcdefghijklmnopqrstuvwxyz".each_char.to_a
    cipher = {} of Char => Char
    (0..alphabet.size - 1).each do |i|
      cipher[alphabet[i]] = alphabet[alphabet.size - i - 1]
    end
    s.downcase.gsub(" ", "").each_char
      .select {|c| c.letter? || c.number? }
      .map {|c| if c.letter? ; cipher[c] ; else ; c ; end }
      .in_groups_of(5, ' ')
      .reduce([] of Array(Char)) {|res,arr| arr << ' '; res << arr}
      .flatten
      .reduce("") {|acc, c| acc + c}
      .strip
  end

end
