class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.gym == self}
  end

  def lifters
    memberships.map {|membership| membership.lifter}
  end

  def lifter_names
    lifters.map {|lifter| lifter.name}
  end

  def lift_total
    arr_of_lift_totals = lifters.map {|lifter| lifter.lift_total}
    total_lift_total = arr_of_lift_totals.inject(:+)
  end

  def self.highest_lift_total
    self.gym_with_the_highest_lift_total.lift_total
    # arr = self.all.map {|gym| gym.lift_total } 
    # arr.sort.reverse[0]
  end


  def self.gym_with_the_highest_lift_total
    self.all.max_by do |gym|
      gym.lift_total
    end
    # self.all.find do |gym|
    #   gym.lift_total == self.highest_lift_total
    # end
  end

  def close
    self.memberships.each do |membership|
      membership.gym = nil
    end
  end

  def apply_discounts(threshold, discount)
    lifters.each do |lifter|
      if lifter.lift_total > threshold
        # apply discount
        lifters_membership = lifter.gym_membership(self)
        lifters_membership.cost *= 1 - discount
      end
    end
  end

end


