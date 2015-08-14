class EditTask
  def initialize(request)
    puts request
    task = request.task
    task.instruction = request.instruction
    task.due_date = request.due_date
    @task = task
  end

  def result
    @task
  end
end
