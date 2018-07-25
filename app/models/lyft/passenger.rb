

class Passenger
  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def drivers
    self.rides.map{|ride|
      ride.driver
    }.uniq
  end

  def rides
    Ride.all.select{|ride|ride.passenger == self}
  end

  def self.all
    @@all
  end

  def total_distance
    total = 0
    self.rides.each{|ride|
      total += ride.distance
    }
    total
  end

  def self.premium_members
    self.all.select{|p|
      p.total_distance>100
    }
  end


end
