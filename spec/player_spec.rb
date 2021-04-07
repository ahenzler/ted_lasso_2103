require './lib/player'

RSpec.describe Player do
  context 'exists' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    it 'exists' do
    expect(roy).to be_instance_of(Player)
    end

    it 'has attributes' do
    expect(roy.name).to eq("Roy Kent")
    expect(roy.position).to eq("Center Midfielder")
    expect(roy.salary).to eq(1_000_000)
    end
  end
end