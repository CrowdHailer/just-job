require_relative '../entities/todo_list'
require_relative './create_todo_list/request_interface'

class CreateTodoList
  def initialize(request)
    RequestInterface.required_on! request
    @todo_list = TodoList.new request.name
    TodoList::Repository.add @todo_list
  end

  def result
    @todo_list
  end
end
