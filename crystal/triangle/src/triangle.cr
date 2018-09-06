# Please implement your solution to triangle in this file

class Triangle

  def initialize(sides : Array(Int32))
    @sides = sides
  end

  def zero_length?
    @sides.size != 3 || @sides.includes? 0
  end

  def triangle_inequality?
    (@sides[0] + @sides[1] < @sides[2]) ||
      (@sides[0] + @sides[2] < @sides[1]) ||
      (@sides[1] + @sides[2] < @sides[0])
  end

  def equilateral?
    return false if zero_length? || triangle_inequality?
    1 == @sides.uniq.size
  end

  def isosceles?
    return false if zero_length? || triangle_inequality?
    2 >= @sides.uniq.size
  end

  def scalene?
    return false if zero_length? || triangle_inequality?
    3 == @sides.uniq.size
  end

end
