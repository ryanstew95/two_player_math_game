class Player
  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def increase_score
    @score += 1
  end

  def has_lives?
    @lives > 0
  end

  def display_score
    "#{@name}: Score: #{@score}, Lives: #{@lives}"
  end
end
