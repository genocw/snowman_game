require("minitest/autorun")
require("minitest/rg")
require_relative("../player.rb")

class TestPlayer < MiniTest::Test

  def setup()
    @player1 = Player.new("Sam")
  end

  def test_has_name()
    assert_equal("Sam", @player1.name())
  end

  def test_starts_with_6_lives()
    assert_equal(6, @player1.lives())
  end

end
