# Please implement your solution to gigasecond in this file

module Gigasecond

  def self.from(time)
    time + Time::Span.new(0, 0, 1000000000)
  end

end
