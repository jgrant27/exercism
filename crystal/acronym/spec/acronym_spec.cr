require "spec"
require "../src/*"

describe "Acronym" do
  it "does basic" do
    Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
  end

  it "does lowercase words" do
    Acronym.abbreviate("Ruby on Rails").should eq("ROR")
  end

  it "does punctuation" do
    Acronym.abbreviate("First In, First Out").should eq("FIFO")
  end

  it "does all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  it "does punctuation without whitespace" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end
end
