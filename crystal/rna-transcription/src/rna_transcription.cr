# Please implement your solution to rna-transcription in this file

module RnaComplement

  def self.of_dna (d)
    # One liner
    d.tr("GCTA", "CGAU")

    # # Using map
    # d2r = {"G" => "C",
    #        "C" => "G",
    #        "T" => "A",
    #        "A" => "U"}
    # r = ""
    # d.each_char { |c| r += d2r[c.to_s] }
    # r
  end

end
