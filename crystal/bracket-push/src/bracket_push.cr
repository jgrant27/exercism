# Please implement your solution to bracket-push in this file

module Brackets

  def self.are_valid?(s)

    pairs = Hash{'{'=>'}', '['=>']', '('=>')'}
    open_char_set, close_char_set = pairs.keys.to_set, pairs.values.to_set
    open_chars = [] of Char
    s.each_char do |c|
      if open_char_set.includes? c
        open_chars << c
      elsif close_char_set.includes? c
        if open_chars.empty? ||
           c != pairs[open_chars[open_chars.size-1]]
          return false
        else
          open_chars.pop
        end
      end
    end
    open_chars.empty?
  end

end
