# Please implement your solution to hamming in this file

module Hamming

  def self.compute(st1, st2)
    raise ArgumentError.new("Strand sizes are not the same length") \
                           if (st1.size != st2.size)

    st1.each_char.zip(st2.each_char).count { |c1, c2| c1 != c2 }
  end

end
