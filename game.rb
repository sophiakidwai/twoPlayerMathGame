class Game
  attr_accessor :player1, :player2
  def initialize
    @question
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @turn = 0
    @current_player
    @opponent
  end

  def greetings
    puts player1.greeting, player2.greeting
    puts "------- LET'S START --------"
  end

  def whos_turn
    @turn += 1

    if @turn.odd? 
      @current_player = player1
      @opponent = player2
    else
      @current_player = player2
      @opponent = player1
    end

    @question = Question.new

    puts "#{@current_player.name} #{@question.question}"
    print "> "

    answer = gets.chomp.to_i

      

    if answer == @question.answer
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.loss
    end
    puts "#{@current_player.name}: #{@current_player.lives}/3 vs #{@opponent.name}: #{@opponent.lives}/3 "
      

    if @current_player.over
      end_game
    else 
      puts "------- NEXT TURN --------"
      whos_turn
    end
  end

  def end_game
    puts "------- GAME OVER! --------"
    puts "#{@opponent.name} wins with a score of #{@opponent.lives}/3"
    puts "Good bye!"
    exit()
  end

  def start_game
    greetings
    whos_turn
  end
  
end