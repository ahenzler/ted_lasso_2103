require './lib/player'
require './lib/team'

RSpec.describe Team do
  context 'exists' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'exists' do
    expect(richmond).to be_instance_of(Team)
    end

    it 'has attributes' do
    expect(richmond.name).to eq("AFC Richmond")
    expect(richmond.coach).to eq("Ted Lasso")
    expect(richmond.players).to eq([roy, sam])
    end
  end

  context 'team details' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'has a players total salary' do
    expect(richmond.total_salary).to eq(1600000)
    end

    it 'has a highest paid' do
    expect(richmond.highest_paid).to eq(roy)
    end

    it 'has a captain' do
    expect(richmond.captain).to eq("Roy Kent")
    end

    it 'has positions that are filled' do
    expect(richmond.positions_filled).to eq(["Center Midfielder", "Right-back Defender"])
    end
  end
end
