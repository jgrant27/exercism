module Primes

  def self.sieve(limit)
    res, marks, range = [] of Int32, Array.new(limit, false), 2..limit
    range.each_with_index do |n, i|
      if !marks[i] # Process prime
        res << n
        # Mark non primes
        range.each_with_index { |o, j| marks[j] = true if 0 == o % n }
      end
    end
    res
  end

end
