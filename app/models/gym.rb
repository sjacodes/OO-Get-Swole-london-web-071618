class Gym

 @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    # - Get a list of all memberships at a specific gym
    gym_membership = Membership.all.select {|membership| membership.gym == self}
  end

  def lifters
    # - Get a list of all the lifters that have a membership to a specific gym
    gym_membership = Membership.all.select {|membership| membership.gym == self}
    gym_membership.map {|membership| membership.lifter}
  end

  def lifters_names
    # - Get a list of the names of all lifters that have a membership to that gym
    lifters.map {|lifter| lifter.name}
  end

  def combined_lift_total
    # - Get the combined lift_total of every lifter has a membership to that gym
    array_of_gyms_lift_total = lifters.map {|lifter| lifter.total}
    array_of_gyms_lift_total.inject(:+)
  end

end
