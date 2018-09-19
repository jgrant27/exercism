class Node
  include Enumerable(Int32)
  include Iterable(Int32)

  property value : Int32
  property parent : Node?
  property left : Node?
  property right : Node?

  def initialize(@value : Int32)
  end

  def insert(val : Int32)
    if val <= @value
      if left = @left
        left.insert(val)
      else
        left = Node.new(val)
        left.parent = self
      end
      @left = left
    else
      if right = @right
        right.insert(val)
      else
        right = Node.new(val)
        right.parent = self
      end
      @right = right
    end
  end

  def search(sval : Int32)
    return self if @value == sval
    if sval < @value && (left = @left)
      left.search(sval)
    elsif right = @right
      right.search(sval)
    end
  end

  def to_array()
    arr = [] of Int32
    if left = @left ; arr = arr + left.to_array ; end
    arr << @value
    if right = @right ; arr = arr + right.to_array ; end
    arr
  end

  def successor(val : Int32)
    arr = to_array
    if si = arr.index(val) ; arr[si+1] ; end
  end

  def delete(val : Int32)
    if node = search(val)
      if !node.left && !node.right && (parent = node.parent)
        parent.left = nil if parent.left == node
        parent.right = nil if parent.right == node
      elsif !node.left && (right = node.right)
        node.value = right.value ; node.right = nil
      elsif !node.right && (left = node.left)
        node.value = left.value ; node.left = nil
      elsif node.left && node.right && (sval = successor(node.value))
        delete(sval)
        node.value = sval
      end
    end
  end

  def each()
    to_array.each
  end

  def each(&block : T -> _)
    to_array.each &block
  end

  def map(&block : T -> _)
    to_array.map &block
  end

  def each_cons(count : Int)
    to_array.each_cons(count)
  end

end
