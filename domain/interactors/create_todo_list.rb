require_relative '../entities/todo_list'

class CreateTodoList
  def initialize(request)

  end

  def result
    TodoList.new
  end
end
