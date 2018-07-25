

class Pledge
  @@all = []
  attr_reader :amount, :user, :project

  def initialize(amount, user, project)
    @user = user
    @amount = amount
    @project = project
    @@all << self
  end

  def self.all
    @@all
  end

  def self.projects(project_obj)
    self.all.select{|p|p.project == project_obj}
  end

  def self.users(user_obj)
    self.all.select{|p|p.user == user_obj}
  end
end
