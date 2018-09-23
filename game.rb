class Game

  attr_reader :player, :word, :guessed

  def initialize(player, word)
    @player = player
    @word = word
    @guessed = []
  end

  def update_display(letter)
      @word.find_letter(letter)
  end

  def guess_letter(letter)
    @guessed.push(letter)
    if @word.contains?(letter)
      update_display(letter)
      return true
    else
      @player.lives -= 1
      return false
    end
  end

end
