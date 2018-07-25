require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


def test(str, v1=nil, v2=nil)
 if v1 != v2
   puts str.red
   puts "\texpect: #{v2}, \n\tgot: #{v1}".red
 else
   puts str.green
 end
end

user1 = User.new("user1")
user2 = User.new("user2")
user3 = User.new("user3")
user4 = User.new("user4")
project1 = user1.create("project1", 1000)
project2 = user2.create("project2", 2000)
project3 = user2.create("project3", 2000)
user1.back(project1, 500)
user1.back(project1, 300)
user2.back(project1, 300)
user3.back(project2, 500)
user2.back(project2, 1000)
user1.back(project1, 100)

test "--------TEST--CROWDFUNDING--------------"
test "User:"
test "1. User.highest_pledge ", User.highest_pledge, user2
test "2. User.multi_pledger ", User.multi_pledger, [user1,user2]
test "3. User.project_creator", User.project_creator,[user1, user2]

test "Project"
test "1. Project.no_pledges ", Project.no_pledges, [project3]
test "2. Project.above_goal ", Project.above_goal, [project1]
test "3. most_backers ", Project.most_backers, project1

pass1 = Passenger.new("pass1")
pass2 = Passenger.new("pass2")
pass3 = Passenger.new("pass3")
driver1 = Driver.new("driver1")
driver2 = Driver.new("driver2")
driver3 = Driver.new("driver3")
driver4 = Driver.new("driver4")
ride1 = Ride.new(driver1, pass1, 20)
ride2 = Ride.new(driver1, pass2, 30)
ride3 = Ride.new(driver2, pass3, 120)
ride4 = Ride.new(driver1, pass3, 10)
ride5 = Ride.new(driver3, pass1, 90)




test ""
test "--------TEST--LYFT--------------"
test "passenger"
test "1. pass1.drivers ", pass1.drivers, [driver1, driver3]
test "2. pass2.rides ", pass2.rides, [ride2]
test "3. pass3.total_distance ", pass3.total_distance, 130
test "4. Passenger.premium_members ", Passenger.premium_members, [pass1,pass3]

test "Driver"
test "1. driver1.passengers ", driver1.passengers, [pass1, pass2, pass3]
test "2. driver2.rides ", driver2.rides, [ride3]
test "3. mileage_cap ", Driver.mileage_cap(80), [driver2, driver3]

test "Ride"
test "1. average_distance", Ride.average_distance, 270/5
