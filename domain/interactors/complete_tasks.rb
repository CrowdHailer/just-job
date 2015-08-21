require_relative './complete_tasks/request_interface'
class CompleteTasks
  def initialize(request)
    RequestInterface.required_on! request
    @tasks = request.tasks.map &:complete
  end

  def result
    @tasks
  end

  def outcome
    :success
  end
end
