module React

  class Cell
    @cbs = [] of Proc(Array(Int32))

    def value
    end

    def cbs
      @cbs
    end

    def cbs=(cbs)
      @cbs = cbs
    end

  end

  class InputCell < Cell
    @value : Int32

    def initialize(value)
      @value = value
    end

    def value
      @value
    end

    def value=(val)
      @value = val
      @cbs.each &.call
    end

  end

  class ComputeCell < Cell

    @cells : Array(Cell)
    @block : Proc(Int32, Int32)?
    @block2 : Proc(Int32, Int32, Int32)?

    def initialize(cell : Cell,
                   &block : Proc(Int32, Int32))
      @cells = [cell] of Cell
      @block = block
      @cbs = [] of Proc(Array(Int32))
    end

    def initialize(*cells,
                   &block : Proc(Int32, Int32, Int32))
      @cells = cells.reduce([] of Cell) {|acc, n| acc << n}
      @block2 = block
      @cbs = [] of Proc(Array(Int32))
    end

    def value()
      if !@block.nil?
        @block.not_nil!.call (@cells.map &.value)[0].not_nil!
      elsif !@block2.nil?
        @block2.not_nil!
          .call *(Tuple(Int32, Int32).from(@cells.map &.value))
      else
        0
      end
    end

    def add_callback(&block : Proc(Int32, Array(Int32)))
      cb = ->(){ block.call self.value }
      @cells.each { |cell| cell.cbs << cb }
      cb
    end

    def remove_callback(cb)
      @cells.each { |cell| cell.cbs.delete cb }
    end

  end

end
