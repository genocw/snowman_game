require_relative("game.rb")
require_relative("player.rb")
require_relative("word.rb")

def get_word()
  @secret_word = gets.chomp.downcase
  puts "\e[H\e[2J"
  if @secret_word.include?(" ")
    puts "Just one word this time, please.."
    @secret_word = gets.chomp.downcase
    puts "\e[H\e[2J"
  end
end

puts "Let's play a game!"
puts "What is your name?"
player_name = gets.chomp.capitalize
puts "\e[H\e[2J"
puts "Okay, #{player_name}, now without peeking.. Ask someone to enter a secret word for you to guess:"

get_word()
puts "Ooooh! That'll be tricky to guess!"

player = Player.new(player_name)
new_word = Word.new(@secret_word)
game = Game.new(player, new_word)

sleep(1)
puts ""
puts "Okay, here's the deal. You've got 6 lives. You guess one letter at a time."
sleep(2)
puts ""
puts "Everytime you guess the wrong letter you lose a life and part of our snowman melts."
sleep(2)
puts ""
puts "Try not to kill the snowman, #{player_name}..."
puts ""
puts ""
sleep(1.5)
puts "Your word has #{new_word.word.length} letters in it:"
puts new_word.display
sleep(1.5)

until player.lives < 0 || new_word == new_word.display
  puts "Which letter would you like to guess?"
  letter = gets.chomp.downcase
  result = game.guess_letter(letter)
  if result == true
    puts "Yesss! '#{letter}' is in the word:"
  elsif result == false
    puts "Sorry, buddy - no luck."
    sleep(1)
    puts "'#{letter}' isn't in the word."
    sleep(1)
    puts "You now have #{player.lives} lives left."
  end
  sleep(1)
  puts ""
  puts "You have guessed these letters: #{game.guessed}"
  puts new_word.display
  puts ""
end
# while? lives > 0
  # ask for letter
  # success/fail message
  # updated display
  # you have x lives left
  # etc
