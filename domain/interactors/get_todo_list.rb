require_relative '../entities/task/repository'
require_relative './get_todo_list/request_interface'

class GetTodoList
  def initialize(request)
    @tasks = Task::Repository.for_todo_list request.name
  end

  def result
    @tasks
  end
end
