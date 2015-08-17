class DeleteTask
  def initialize(request)
    task = request.task
    Task::Repository.remove task
  end

  def result
    true
  end
end
