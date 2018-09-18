module Primes

  def self.sieve(limit)
    res = [] of Int32
    marks = Array.new(limit, false)
    (2..limit).each_with_index do |n, i|
      next if marks[i] # Continue if marked as not prime
      res << n # ... or add prime
      (2..limit).each_with_index do |o, j|
        # Mark non primes
        marks[j] = 0 == o % n if !marks[j]
      end
    end
    res
  end

end
