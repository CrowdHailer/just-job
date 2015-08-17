require_relative '../entities/task'
require_relative './create_task/request_interface'

class CreateTask
  def initialize(request)
    @task = Task.new request.todo_list, request.instruction
    Task::Repository.add @task
  end

  def result
    @task
  end
end
