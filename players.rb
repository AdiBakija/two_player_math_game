class Player
  attr_reader :name, :lives
  MAX_LIVES = 3
  def initialize(name)
    @name = name
    @lives = MAX_LIVES
  end

  def reduce_life
    @lives -= 1
  end

  def lost_game?
    @lives == 0
  end

end