require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")
require_relative("../player.rb")
require_relative("../word.rb")

class TestGame < MiniTest::Test

  def setup()
    @word1 = Word.new("hello")
    @player1 = Player.new("Sam")
    @game1 = Game.new(@player1, @word1)
  end

  def test_has_player()
    assert_equal(@player1, @game1.player())
  end

  def test_has_word()
    assert_equal(@word1, @game1.word())
  end

  def test_has_guessed_letters_array()
    assert_equal([], @game1.guessed())
  end

  def test_can_update_display__found()
    @game1.update_display("l")
    assert_equal("**ll*", @word1.display())
  end

  def test_can_update_display__not_found()
    @game1.update_display("t")
    assert_equal("*****", @word1.display())
  end

  def test_guess_letter()
    assert_equal(true, @game1.guess_letter("l"))
    assert_equal(false, @game1.guess_letter("t"))
  end

  def test_guess_letter_decreases_lives()
    @game1.guess_letter("t")
    assert_equal(5, @player1.lives())
  end

  def test_guess_letter_records_checked_letters()
    @game1.guess_letter("t")
    assert_equal(["t"], @game1.guessed())
  end

end
