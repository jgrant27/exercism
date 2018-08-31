module RunLengthEncoding

  private def self.encode_write_prev_char(acc)
    "#{acc[0]}#{acc[2] if 1!=acc[2]}#{acc[1]}"
  end

  def self.encode(s)

    return s if s.empty?

    rs = s.each_char.skip(1).reduce({"", s[0], 1}) do |acc, ch|
      if acc[1]==ch
        {acc[0], ch, acc[2]+1} # keep counting
      else
        {encode_write_prev_char(acc), ch, 1} # add char count
      end
    end
    # Write last char to encoded string and return
    encode_write_prev_char(rs)

  end

end
