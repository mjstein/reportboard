class Task
  @@all_tasks = []

  def initialize(description, owner, priority, duration, title) 
    @description = description
    @owner = owner
    @priority = priority
    @duration = duration
    @title = title
    @time=Time.now.strftime("%m/%d/%Y %H:%M:%S")
  end


  def header
    "#{time()}: #{title()}"
  end

  def paragraph
    "#{owner()} -- #{description()}"
  end

  def self.all 
    @@all_tasks.sort{|a,b| b.time <=> a.time}
  end

  def save 
    @@all_tasks.push(self)
  end

  def self.clear 
    @@all_tasks = []
  end

  def time
    @time 
  end

  private
  def description 
    @description
  end

  def title 
    @title
  end

  def owner
    @owner
  end

  def priority
    @priority
  end

  def duration_valid
    @duration
  end

end
