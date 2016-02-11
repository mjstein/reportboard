require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")

class SystemsEngineering < Sinatra::Base
get("/") do
    @tasks = Task.all()
      erb(:index)
end

post("/tasks") do
      description = params.fetch("description")
      owner = params.fetch('owner')
      priority = params.fetch('priority')
      duration = params.fetch('duration')
      title = params.fetch('title')
      task = Task.new(description, owner, priority,duration, title )
      task.save()
      redirect ('/')
end
end
