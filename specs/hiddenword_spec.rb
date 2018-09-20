require("minitest/autorun")
require("minitest/rg")
require_relative("../hiddenword.rb")

class TestHiddenWord < MiniTest::Test

  def setup()
    @hidden1 = HiddenWord.new("help")
    @hidden2 = HiddenWord.new("whatever")
  end

  def test_has_word()
    assert_equal("help", @hidden1.word)
    assert_equal("whatever", @hidden2.word)
  end

  def test_has_display_word()
    assert_equal("****", @hidden1.display_word())
    assert_equal("********", @hidden2.display_word())
  end

end
