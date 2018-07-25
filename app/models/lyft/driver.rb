

class Driver
  @@all = []
  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def passengers
    self.rides.map{|r| r.passenger}.uniq
  end

  def rides
    Ride.all.select{|ride|
      ride.driver == self
    }
  end

  def self.all
    @@all
  end

  def total_distance
    total = 0
    self.rides.each{|ride| total+=ride.distance}
    total
  end
  def self.mileage_cap(distance)
    self.all.select{|d| d.total_distance > distance}
  end
  
end
