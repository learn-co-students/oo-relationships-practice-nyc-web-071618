
class Project
  attr_reader :creator, :name, :goal
  @@all = []
  def initialize(creator,name, goal)
    @creator = creator
    @name = name
    @goal = goal
    # @cur_amount = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def self.no_pledges
    self.all.select{|project|
      # project.cur_amount == 0

      Pledge.projects(project).size == 0
    }
  end

  def self.above_goal   #
    self.all.select{|project|
      total = 0
      Pledge.projects(project).select{|pledge|
        total += pledge.amount
      }
      total >= project.goal
    }
  end

  def self.most_backers  #max user pledge
    size = 0
    ans = nil
    self.all.each{|project|
      user_arr = Pledge.projects(project).map{|pledge|pledge.user}.uniq
      if user_arr.size > size
        size = user_arr.size
        ans = project
      end
    }
    ans
  end

end
