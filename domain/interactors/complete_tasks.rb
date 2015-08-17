require_relative './complete_tasks/request_interface'
class CompleteTasks
  def initialize(request)
    @tasks = request.tasks.map &:complete
  end

  def result
    @tasks
  end
end
