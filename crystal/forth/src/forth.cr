module Forth

  ARITH_OPS = Set{"+", "-", "*", "/"}
  STACK_OPS = Set{"DUP", "DROP", "SWAP", "OVER"}

  def self.do_arith_op(a, b, tok)
    case tok
    when "+" ; a + b
    when "-" ; a - b
    when "*" ; a * b
    when "/" ; a / b
    else ; 0
    end
  end

  def self.do_stack_op(stack, tok)
    case tok
    when "DUP" ; stack << stack.last
    when "DROP" ; stack.pop
    when "SWAP"
      x = stack.pop
      y = stack.pop
      stack << x
      stack << y
    when "OVER"
      x = stack.pop
      y = stack.pop
      stack << y
      stack << x
      stack << y
    end
    stack
  end

  def self.process_custom_ops(s)
    if custom_ops = s.split(" ;")
      if custom_ops.size > 1
        # Get the custom op defs
        custom_ops = custom_ops
                     .select {|seg| seg[0] == ':'}
                     .map &.gsub(": ", "")
        custom_ops_map = {} of String => String
        # Generate the custom ops mappings ...
        (0...custom_ops.size).each do |i|
          kv = custom_ops[i].split(" ")
          if kv[0].to_i?.nil?
            custom_ops_map[kv[0]] =
              kv[1..kv.size-1].reduce {|s,w| "#{s} #{w}"}
            # ... and remove the custom op defs
            s = s.gsub(": #{custom_ops[i]} ;", "")
          end
        end
        # Replace the custom calls with their implementation.
        custom_ops_map
          .each_key { |k| s = s.gsub(k, custom_ops_map[k]) }
      end
    end
    s
  end

  def self.evaluate(s)
    stack = [] of Int32
    process_custom_ops(s.upcase).split(" ").each do |tok|
      tok = tok.upcase
      if tok.to_i?.is_a?(Int)
        stack << tok.to_i
      elsif ARITH_OPS.includes? tok
        raise Exception.new() if stack.empty? || stack.size == 1
        stack.reduce { |a, n| stack[0] = do_arith_op(a, n, tok) }
        stack = [stack[0]]
      elsif STACK_OPS.includes? tok
        raise Exception.new() if stack.empty?
        stack = do_stack_op(stack, tok)
      else
        raise Exception.new
      end
    end
    stack
  end

end
