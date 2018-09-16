module Pangram

  def self.pangram?(s)
    letters = "abcdefghijklmnopqrstuvwxyz "
    s.downcase.gsub("_", " ").each_char { |c| letters = letters.delete c }
    letters.empty?
  end

end
