class Player
  attr_reader :name,
              :position,
              :salary

  def initialize(info)
    @name = info[:name]
    @position = info[:position]
    @salary = info[:salary]
  end
end