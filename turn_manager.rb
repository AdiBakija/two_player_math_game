class TurnManager

attr_reader :round_number, :answer, :current_index

  def initialize players
    @round_number = 0
    @current_index = 0
    @players = players.dup
    @answer = nil
  end

  def next_round
    @round_number += 1
    @current_index = (@current_index + 1) % @players.count
    puts "Round Number #{round_number}"
    puts "----------------------------------------"
    puts "#{@players[@current_index].name}: #{generate_question}"
    puts ""
  end

  def generate_question
    value1 = 1 + rand(20)
    value2 = 1 + rand(20)
    @answer = value1 + value2
    "What does #{value1} + #{value2} equal?"
  end

end