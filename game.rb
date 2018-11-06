require_relative './turn_manager'
require_relative './players'

class Game

  def initialize
    @players = [Player.new("Adi"), Player.new("Albert Einstein")]
    @turn = TurnManager.new(@players)
  end

  def play
    while (not game_over?) do
      # get the next turn from the turn_manager
      @turn.next_round
      answer = gets.chomp.to_i
      puts ""
      if answer == @turn.answer
        puts "That is the correct answer, good job #{@players[@turn.current_index].name}!"
        puts ""
        puts "P1: #{@players[0].lives}/3 VS P2: #{@players[1].lives}/3"
        puts ""
      else
        puts "That is the wrong answer!"
        puts ""
        @players[@turn.current_index].reduce_life
        puts "P1: #{@players[0].lives}/3 VS P2: #{@players[1].lives}/3"
        puts ""
      end

      # Print the round summary
      # print_summary

      # Wait 0.5 seconds so we can actually watch the game go
      sleep 0.5
    end
    end_game_summary
  end

  def game_over?
    @players.any? do |player|
      player.lost_game?
    end
  end

  def game_winner
    winner = ''
    @players.each do |player|
      if player.lives > 0
        winner = player.name
      end
    end
    return winner
  end

  def end_game_summary
    puts ""
    puts "GAME OVER!"
    puts "#{game_winner} Wins!"
    puts "Congratulations"
  end


end