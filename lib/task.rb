require 'yaml'
class Task
  @@backup_file='backup/list.dat'
  @@all_tasks = File.exists?(@@backup_file)? YAML::load(File.open(@@backup_file)):[]

  def initialize(description, owner, priority, duration, title) 
    @description = description
    @owner = owner
    @priority = priority
    @title = title
    @time=Time.now
    @expiry_time = @time + duration.to_i
  end


  def header
    "#{owner} @ #{time()} <br> -- #{title()}"
  end

  def paragraph
    description()
  end

  def self.all 
    @@all_tasks.delete_if{|a| a.duration_invalid? }.sort!{|a,b| b.time <=> a.time} 
    backup_list()
    @@all_tasks
  end

  def self.backup_list
    File.open(@@backup_file,'w'){ |file| file.write(YAML::dump(@@all_tasks)) }

  end

  def save 
    @@all_tasks.push(self)
  end

  def self.clear 
    @@all_tasks = []
  end

  def time
    @time.strftime("%m/%d/%Y %H:%M:%S")

  end

  def duration_invalid?
    Time.now > @expiry_time 
  end

  private

  ["description", "title", "owner","priority"].each do |name|
    define_method(name) do
      instance_variable_get("@#{name}")
    end
  end
end
