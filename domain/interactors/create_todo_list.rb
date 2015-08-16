require_relative '../entities/todo_list'

class CreateTodoList
  def initialize(request)

  end

  def result
    TodoList.new :default_name
  end
end
