module PascalsTriangle

  def self.rows(n)
    raise ArgumentError.new if n < 0
    res = [] of Array(Int32)
    (1..n).each do |i|
      if res.empty?
        res << [1]
      else
        last_row = res.last
        new_row = Array(Int32).new(last_row.size + 1, 0)
        (0..new_row.size-1).each do |j|
          pi = j-1 ; new_row[j] += last_row[pi] if pi >= 0
          ni = j ; new_row[j] += last_row[ni] if ni <= last_row.size - 1
        end
        res << new_row
      end
    end
    res
  end

end
