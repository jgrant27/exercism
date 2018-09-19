module Binary

  def self.to_decimal(bs : String)
    if bs.each_char.uniq.any? {|d| d!='0' && d!='1'}
      raise ArgumentError.new() ; end
    bs.reverse.each_char.reduce({0,0}) { |acc, c|
      {acc[0] + c.to_i * 2 ** acc[1], acc[1]+1} }[0]
  end

end
