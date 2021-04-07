require './lib/player'
require './lib/team'
require './lib/league'

RSpec.describe League do
  context 'exists' do
    premier = League.new("Premier League")

    it 'exists' do
      expect(premier).to be_instance_of(League)
    end

    it 'has attributes' do
      expect(premier.name).to eq("Premier League")
      expect(premier.teams).to eq([])
    end
  end

  context 'league details' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier = League.new("Premier League")

    it 'can add teams' do
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.teams).to eq([richmond, manchester])
    end

    it 'can access team capitans' do
      expect(premier.capitans).to eq([roy, fernandinho])
    end

    it 'can sort players by team' do
      expected = {"AFC Richmond"=>["Roy Kent", "Sam Obisanya"], "Manchester City FC"=>["Jamie Tartt", "Fernandinho"]}
      expect(premier.players_by_team).to eq(expected)
    end
  end

  context 'league details' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier = League.new("Premier League")

    it 'has a most expensive player' do
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.most_expensive_player).to eq(["Fernandinho"])
    end

    it 'can sort players by salary' do
      expected = {
      "Over 0M" => ["Sam Obisanya"],
      "Over 1M" => ["Roy Kent", "Jamie Tartt"],
      "Over 2M" => [],
      "Over 3M" => [],
      "Over 4M" => [],
      "Over 5M" => ["Fernandinho"],
    }
      expect(premier.players_by_salary_range).to eq(expected)
    end
  end
end
