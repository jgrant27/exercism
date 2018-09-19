module Anagram

  def self.find(str, words)
    words = Set.new(words).map { |word| word.downcase }
    matches = Set.new [] of String
    str.downcase.each_char.to_a.each_permutation do |perm|
      permstr = perm.reduce("") {|s, c| s + c}
      matches << permstr if words.includes?(permstr) && permstr!=str
    end
    matches.to_a.reverse
  end

end
