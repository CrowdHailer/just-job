require_relative '../entities/task'
require_relative './create_task/request_interface'

class CreateTask
  def initialize(request)
    RequestInterface.required_on! request
    if request.valid?
      # fetch method on repository would be better to allow error handling
      todo_list = TodoList::Repository[request.todo_list_name]
      unless todo_list
        @outcome = :not_found
        return
      end
      @task = Task.new todo_list, request.instruction
      Task::Repository.add @task
      @outcome = :created
    else
      @outcome = :bad_request
    end
  end

  def result
    @task
  end

  def outcome
    @outcome
  end
end
