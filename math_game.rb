require_relative 'player'
require_relative 'question'

class MathGame
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
    @game_over = false
  end

  def start
    while !@game_over
      new_turn
      switch_players
      display_scores
    end
    announce_winner
  end

  def new_turn
    question = Question.new
    question.ask_question
    user_answer = gets.chomp
    if question.correct?(user_answer)
      @current_player.increase_score
      puts "Correct! You've earned a point."
    else
      @current_player.lose_life
      puts "Incorrect. You lost a life."
    end
    @game_over = !@current_player.has_lives?
  end

  def switch_players
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def display_scores
    puts "----- Current Scores -----"
    puts @player1.display_score
    puts @player2.display_score
    puts "--------------------------"
  end

  def announce_winner
    winner = (@player1.has_lives?) ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.score}!"
    puts "#{winner.name}'s opponent scored #{(winner == @player1) ? @player2.score : @player1.score}."
  end
end

