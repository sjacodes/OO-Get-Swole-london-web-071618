
class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|membership| membership.lifter == self}
  end


  def gyms
    memberships.map {|membership| membership.gym}
  end

  def self.ave_lift_total
    total_lift_total = 0
    Lifter.all.each do |lifter|
      total_lift_total += lifter.lift_total
  end
  ave_lift_total = total_lift_total/Lifter.all.length
end

  def total_cost_of_memberships
    arr_of_costs = memberships.map {|membership| membership.cost}
    total_of_memberships = arr_of_costs.inject(:+)
  end

  def new_membership(gym, cost)
    Membership.new(self, gym, cost)
  end

  def gym_membership(gym)
    memberships.find{|membership| membership.gym == gym}
  end


end
