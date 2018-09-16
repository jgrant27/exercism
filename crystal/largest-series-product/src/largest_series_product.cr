require "big"

class Series
  def initialize(digits : String)
    @digits = digits
  end

  def largest_product(n)
    raise ArgumentError.new() if n < 0 || @digits.size < n
    return 1 if @digits.empty?
    lp = 0
    (0..@digits.size-n).each do |i|
      cp = @digits[i...i+n].each_char
           .reduce(BigInt.new(1)) { |acc,c| acc * c.to_i64 }
      lp = cp if cp > lp
    end
    lp
  end
end
