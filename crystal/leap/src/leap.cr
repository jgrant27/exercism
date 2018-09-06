# Please implement your solution to leap in this file

module Year

  def self.leap?(y)
    0 == y % 4 && (0 != y % 100 || 0 == y % 400)
  end

end
