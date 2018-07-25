

class User
  attr_reader :name, :total,:pledge_count
  @@all = []
  def initialize(name)
    @name = name
    # @total = 0
    # @pledge_count = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def create(project_name, goal)
    Project.new(self, project_name, goal)
  end

  def back(project,amount)
    Pledge.new(amount, self, project)
  end

  def self.highest_pledge
    max = 0
    ans = nil
    self.all.each{|user|
      # if user.total > max
      #   max = user.total
      # end
      total = 0
      Pledge.users(user).each{|p| total += p.amount}
        if total > max
          max = total
          ans = user
        end
    }
    ans
  end

  def self.multi_pledger
    self.all.select{|user|
      # u.pledge_count > 1
      Pledge.users(user).size>1
    }
  end

  def self.project_creator
    Project.all.map{|p| p.creator }.uniq
  end

end
