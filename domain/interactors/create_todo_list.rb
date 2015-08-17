require_relative '../entities/todo_list'
require_relative './create_todo_list/request_interface'

class CreateTodoList
  def initialize(request)
    RequestInterface.required_on! request
  end

  def result
    TodoList.new :default_name
  end
end
