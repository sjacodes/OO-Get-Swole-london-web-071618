class Membership

  @@all = []

  attr_accessor :gym, :cost
  attr_reader :lifter

  def initialize(lifter, gym, cost)
    @lifter = lifter
    @gym = gym
    @cost = cost
    @@all << self
  end

  def self.all
    @@all
  end


end
