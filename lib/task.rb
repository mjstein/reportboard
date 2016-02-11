class Task
  @@all_tasks = []

  def initialize(description, owner, priority, duration, title) 
    @description = description
    @owner = owner
    @priority = priority
    @duration = duration
    @title = title
  end

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

  def duration
    @duration
  end

  def time
    Time.now
  end

  def header
    "#{time()}: #{title()}"
  end

  def paragraph
    "#{owner()} -- #{description()}"
  end

  def self.all 
    @@all_tasks
  end

  def save 
    @@all_tasks.push(self)
  end

  def self.clear 
    @@all_tasks = []
  end
end
