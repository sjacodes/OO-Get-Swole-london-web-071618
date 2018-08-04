
class Lifter

  @@all = []

  attr_reader :name, :total

  def initialize(name, total)
    @name = name
    @total = total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    #- Get a list of all the memberships that a specific lifter has
    lifters_membership = Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    # - Get a list of all the gyms that a specific lifter has memberships to
    lifters_membership = Membership.all.select {|membership| membership.lifter == self}
    lifters_membership.map {|membership| membership.gym.name}
  end

  def self.average_lift_total
    # - Get the average lift total of all lifters
    lift_total = 0
    Lifter.all.each do |lifter|
      lift_total = lift_total + lifter.total
    end
    ave_lift_total = lift_total/(Lifter.all.length)
  end

  def total_cost_of_membership
    # - Get the total cost of a specific lifter's gym memberships
    lifters_membership = Membership.all.select {|membership| membership.lifter == self}
    cost_of_membership = lifters_membership.map {|membership| membership.cost}
  end

  def new_lifter(cost, gym)
    new_lifter = Membership.new(cost, self, gym)
  end

end
