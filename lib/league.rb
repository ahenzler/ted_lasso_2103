class League
  attr_reader :name,
              :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team_name)
    @teams << team_name
  end

  def capitans
    @teams.map do |team|
      team.highest_paid
    end
  end

  def players_by_team
    team_players = {}
    @teams.each do |team|
      team.players.each do |player|
        if team_players[team.name].nil?
          team_players[team.name] = [player.name]
        else
          team_players[team.name] << player.name
        end
      end
    end
    team_players
  end

  def most_expensive_player
    player = [
    capitans.max_by do |player|
      player.salary
    end.name ]
  end

  def players_by_salary_range
    salary_hash = {
      "Over 0M" => [],
      "Over 1M" => [],
      "Over 2M" => [],
      "Over 3M" => [],
      "Over 4M" => [],
      "Over 5M" => [],
    }
    @teams.each do |team|
      team.players.each do |player|
        if player.salary < 1000000 && player.salary > 0
          salary_hash["Over 0M"] << player.name
        elsif player.salary < 2000000 && player.salary >= 1000000
          salary_hash["Over 1M"] << player.name
        elsif player.salary < 3000000 && player.salary >= 2000000
          salary_hash["Over 2M"] << player.name
        elsif player.salary < 4000000 && player.salary >= 3000000
          salary_hash["Over 3M"] << player.name
        elsif player.salary < 5000000 && player.salary >= 4000000
          salary_hash["Over 4M"] << player.name
        elsif player.salary >= 5000000
          salary_hash["Over 5M"] << player.name
        end
      end
    end
    salary_hash
  end
end