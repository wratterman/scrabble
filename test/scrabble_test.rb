gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_that_tally_is_default_value_of_zero
    assert_equal 0, Scrabble.new.tally
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_two_letters
    word = Scrabble.new
    expected = 4
    actual = word.score("ab")

    assert_equal expected, actual
  end

  def test_it_can_score_two_other_letters
    word = Scrabble.new
    expected = 13
    actual = word.score("kx")

    assert_equal expected, actual
  end

  def test_it_can_score_10_letters
    word = Scrabble.new
    expected = 18
    actual = word.score("strawberry")

    assert_equal expected, actual
  end

  def test_it_can_return_a_max_score_even_though_this_isnt_a_word
    word = Scrabble.new
    expected = 87
    actual = word.score("abcdefghijklmnopqrstuvwxyz")

    assert_equal expected, actual
  end

  def test_space_has_a_value_of_zero
    word = Scrabble.new
    expected = 0
    actual = word.score(" ")

    assert_equal expected, actual
  end

  def test_it_can_score_two_words
    word = Scrabble.new
    expected = 18
    actual = word.score("will ratterman")

    assert_equal expected, actual
  end

  def test_it_can_score_two_other_words
    word = Scrabble.new
    expected = 12
    actual = word.score("cool dude")

    assert_equal expected, actual
  end

  def test_it_can_score_multiple_words
    word = Scrabble.new
    expected = 30
    actual = word.score("will ratterman cool dude")

    assert_equal expected, actual
  end

  def test_nil_score_is_0
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_enter_has_a_score_of_zero
    word = Scrabble.new
    expected = 0
    actual = word.score("")

    assert_equal expected, actual
  end

  def test_punctuation_has_a_score_of_zero
    word = Scrabble.new
    expected = 0
    actual = word.score("!?.,")

    assert_equal expected, actual
  end

  def test_it_can_score_sentences
    word = Scrabble.new
    expected = 33
    actual = word.score("Will Ratterman is a cool dude!")

    assert_equal expected, actual
  end

  def test_numbers_have_a_score_of_zero
    word = Scrabble.new
    expected = 0
    actual = word.score(1234)

    assert_equal expected, actual
  end

  def test_it_will_score_words_but_not_numbers
    word = Scrabble.new
    expected = 14
    actual = word.score("4realz")

    assert_equal expected, actual
  end
end
