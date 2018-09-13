# Please implement your solution to bob in this file

module Bob

  def self.yelling?(s)
    s.each_char().any? {|c| c.uppercase? } &&
      s.each_char().none? {|c| c.lowercase? }
  end

  def self.hey(s)
    # Nothing
    return "Fine. Be that way!" if nil==s || s.strip.empty?
    # Yelling
    if yelling? s.strip
      "Whoa, chill out!"
    # Question
    elsif s.ends_with? "?"
      "Sure."
    # Anything else
    else
      "Whatever."
    end
  end

end
