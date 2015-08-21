module REPL
  class GetTasksRequest
    prepend ::GetTasks::RequestInterface

    def initialize(todo_list: nil)
      todo_list_name = TodoListName.new todo_list
      @todo_list_name = todo_list_name
    end

    def todo_list_name
      @todo_list_name
    end

    def valid?
      true
    end
  end
end
