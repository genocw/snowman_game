class Word

  attr_reader :word
  attr_accessor :display

  def initialize(word)
    @word = word
    # change word string to array of characters
    @characters = word.chars
    @display = "*" * @word.length
  end

  def contains?(letter)
    @word.include? letter
  end

  # loop through array to:
  # check for letter
  # replace that index in display with that letter
  def find_letter(letter)
    @characters.each_with_index { |character, index|
      if character == letter
        @display[index] = letter
      end
    }
  end

end
