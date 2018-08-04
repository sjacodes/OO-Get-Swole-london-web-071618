require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#lifters
sarah = Lifter.new('sarah', 100)
maduri = Lifter.new('maduri', 80)
ritz = Lifter.new('ritz', 60)
casey = Lifter.new('casey', 100)
#gyms
gym1 = Gym.new('gym1')
gym2 = Gym.new('gym2')
gym3 = Gym.new('gym3')

#memberships
membership1 = Membership.new(25, sarah, gym1)
membership2 = Membership.new(30, maduri, gym2)
membership3 = Membership.new(35, ritz, gym3)
membership4 = Membership.new(25, casey, gym1)





binding.pry
