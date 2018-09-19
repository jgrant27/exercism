module Anagram

  def self.find(word, words)
    word_sorted = word.downcase.chars.sort
    Set.new(words.map {|word| word.downcase}
             .select {|word| word.chars.sort == word_sorted})
      .delete(word).to_a
  end

end
