require_relative '../entities/task/repository'
require_relative './get_todo_list/request_interface'

class GetTodoList
  def initialize(request)
    RequestInterface.required_on! request
    @todo_list = TodoList::Repository[request.name]
  end

  def result
    @todo_list
  end
end
