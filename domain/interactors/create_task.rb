require_relative '../entities/task'

class CreateTask
  def initialize(request)
    @task = Task.new request.todo_list, request.instruction
  end

  def result
    @task
  end
end
