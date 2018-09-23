require("minitest/autorun")
require("minitest/rg")
require_relative("../word.rb")

class TestWord < MiniTest::Test

  def setup()
    @word1 = Word.new("hello")
    @word2 = Word.new("whatever")
  end

  def test_has_word()
    assert_equal("hello", @word1.word)
    assert_equal("whatever", @word2.word)
  end

  def test_has_display_word()
    assert_equal("*****", @word1.display())
    assert_equal("********", @word2.display())
  end

  def test_display_word_is_same_length()
    assert(@word1.word.length == @word1.display.length)
  end

  def test_contains_letter()
    assert_equal(true, @word1.contains?("o"))
  end

  def tets_word_str_converts_to_array()
    assert_equal(["h", "e", "l", "l", "o"],@characters)
  end

  def test_display_word_shows_found_letter()
    @word1.find_letter("l")
    assert_equal("**ll*", @word1.display)
  end

end
