class HiddenWord

  attr_reader :word
  attr_accessor :display_word

  def initialize(word)
    @word = word
    @display_word = "*" * @word.length
  end

end
