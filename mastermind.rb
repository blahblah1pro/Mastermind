puts '*--------------------------------------------Mastermind Game---------------------------------------------*'
colors = %w[red blue green yellow orange pink brown silver]
bot = []
def botchoice(colors, bot)
  i = 0
  while i < 4
    bot[i] = colors[rand(colors.length)]
    i += 1
  end
end

def greeting(bot, colors)
  puts 'Hello user'
  puts 'please enter your name!'
  name = gets.chomp
  puts "Hello #{name}"
  puts 'Please enter a variation'
  puts '1 for computer setting guessing colors and you guess it.'
  puts '2 for you set the guessing colors and computer predicts it'
  puts '3 for 1 person set the guess colors and other player predicts it'
  variation = gets.chomp.to_i
  if variation == 1
    guesser_game(bot, colors)
  elsif variation == 2
    creator_game(bot, colors)
  elsif variation == 3
    Twoplayer_game
  else
    puts 'Wrong choice! Enter again'
  end
end

def Twoplayer_game(colors)
  creator_choice = []
  choice = []
  common = []
  turn = 1
  j = 0
  puts 'Enter the creator code:-'
  puts 'Here are the pool of colors'
  puts colors.join(', ')
  puts 'Your color code :-'
  while j < 4
    creator_choice[j] = gets.chomp.downcase
    j += 1
  end
  j = 0
  while turn < 13
    blackpiece = 0
    puts 'So here are the standard colors,you can choose for the game.'
    puts colors.join(', ')
    puts 'For your help we have added white and black signals'
    puts 'White means a color is at wrong place and black means a color is at right place'
    puts 'Enter four guessing colors'
    while j < 4
      choice[j] = gets.chomp.downcase
      j += 1
    end

    choice.each_with_index do |element, index|
      blackpiece += 1 if element == creator_choice[index]
    end
    common = creator_choice & choice
    if blackpiece == 4
      puts 'You won the game'
      return 0
    elsif common.empty?
      puts "\n"
      puts 'NO common elements'
      puts "\n"
    else
      puts "White:#{common.length} Black:#{blackpiece}"
    end
    j = 0
    turn += 1
  end
  puts 'Correct answer:-'
  puts creator_choice
end

def creator_game(bot, colors)
  choice = []
  turn = 1
  j = 0
  puts 'So you want to be creator.Alright!'
  puts 'Enter the secret color code'
  puts 'Here are the pool of colors'
  puts colors.join(', ')
  puts 'Your color code :-'
  while j < 4
    choice[j] = gets.chomp.downcase
    j += 1
  end
  while turn < 13
    blackpiece = 0
    puts "Turn #{turn}"
    botchoice(colors, bot)
    puts bot.join(', ')
    bot.each_with_index do |element, index|
      blackpiece += 1 if element == choice[index]
    end
    common = bot & choice
    if blackpiece == 4
      puts 'You won the game'
      return 0
    elsif common.empty?
      puts "\n"
      puts 'NO common elements'
      puts "\n"
    else
      puts "White:#{common.length} Black:#{blackpiece}"
    end
    turn += 1
  end
  def guesser_game(bot, colors)
    botchoice(colors, bot)
    j = 0
    turn = 1
    common = []
    choice = []
    while turn < 13
      blackpiece = 0
      puts 'So here are the standard colors,you can choose for the game.'
      puts colors.join(', ')
      puts 'For your help we have added white and black signals'
      puts 'White means a color is at wrong place and black means a color is at right place'
      puts 'Enter four guessing colors'
      while j < 4
        choice[j] = gets.chomp.downcase
        j += 1
      end

      choice.each_with_index do |element, index|
        blackpiece += 1 if element == bot[index]
      end
      common = bot & choice
      if blackpiece == 4
        puts 'You won the game'
        return 0
      elsif common.empty?
        puts "\n"
        puts 'NO common elements'
        puts "\n"
      else
        puts "White:#{common.length} Black:#{blackpiece}"
      end
      j = 0
      turn += 1
    end
    puts bot
  end
end
greeting(bot, colors)
