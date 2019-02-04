require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


#lifters
sarah = Lifter.new('Sarah', 30)
sam = Lifter.new('Sam', 50)
nico = Lifter.new('Nico', 100)

#gyms
jimsgym = Gym.new('Jimsgym')
virgin = Gym.new('Virgin')
puregym = Gym.new('Puregym')

#memberships
membership1 = Membership.new(sarah, virgin, 80)
membership2 = Membership.new(sarah, puregym, 60)
membership3 = Membership.new(sam, jimsgym, 100)
membership4 = Membership.new(nico, puregym, 60)


binding.pry
