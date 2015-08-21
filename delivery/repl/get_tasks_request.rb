module REPL
  class GetTasksRequest
    prepend ::GetTasks::RequestInterface

    def initialize(todo_list: nil)
      todo_list_name = TodoListName.new todo_list
      @todo_list_name = todo_list_name
      @valid = true
    rescue ArgumentError
      @valid = false
    end

    def todo_list_name
      @todo_list_name
    end

    def valid?
      @valid
    end
  end
end
