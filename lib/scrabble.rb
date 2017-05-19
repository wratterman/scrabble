class Scrabble

  attr_reader :tally

  def initialize
    @tally = 0
  end

  def score(word)
    if word == nil
      nil_score
    else
      score_calculation(word)
    end
    return tally
  end

  def score_calculation(word)
    word.to_s.each_char do |letter|
      @tally = tally + point_values[letter.upcase]
    end
  end

  def nil_score
    return tally = 0
  end

  def point_values
    {
      "A" => 1, "B" => 3, "C" => 3, "D" => 2,
      "E" => 1, "F" => 4, "G" => 2, "H" => 4,
      "I" => 1, "J" => 8, "K" => 5, "L" => 1,
      "M" => 3, "N" => 1, "O" => 1, "P" => 3,
      "Q" => 10, "R" => 1, "S" => 1, "T" => 1,
      "U" => 1, "V" => 4, "W" => 4, "X" => 8,
      "Y" => 4, "Z" => 10, "" => 0, " " => 0,
      "," => 0, "." => 0, "!" => 0, "?" => 0,
      "'" => 0, "1" => 0, "2" => 0, "3" => 0,
      "4" => 0, "5" => 0, "6" => 0, "7" => 0,
      "8" => 0, "9" => 0, "0" => 0
    }
  end
end
