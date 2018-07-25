


class Ride
  @@all = []
  attr_reader :driver, :passenger, :distance
  def initialize(driver, passenger, distance)
    @driver = driver
    @passenger = passenger
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    return 0 if self.all.size == 0
    total = 0
    self.all.each{|r| total += r.distance}
    total / self.all.size
  end
end
