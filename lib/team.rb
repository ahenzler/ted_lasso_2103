class Team
  attr_reader :name,
              :coach,
              :players

  def initialize(team_name, coach, players)
    @name = team_name
    @coach = coach
    @players = players
  end

  def total_salary
    @players.map do |player|
      player.salary
    end.sum
  end

  def captain
    @players.max_by do |player|
      player.salary
    end.name
  end

  def positions_filled
    @players.map do |player|
      player.position
    end.uniq
  end
end