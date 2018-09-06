# Please implement your solution to raindrops in this file

module Raindrops

  def self.drops(n)
    output = ""
    output += "Pling" if 0 == n % 3
    output += "Plang" if 0 == n % 5
    output += "Plong" if 0 == n % 7
    output = n.to_s if output.size == 0
    output
  end

end
