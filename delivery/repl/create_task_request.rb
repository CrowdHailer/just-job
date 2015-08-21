module REPL
  class CreateTaskRequest
    prepend CreateTask::RequestInterface

    def initialize(todo_list_name, instruction)
      @instruction = Instruction.new instruction
      @todo_list_name = TodoListName.new todo_list_name
      @valid = true
    rescue ArgumentError
      @valid = false
    end

    def todo_list_name
      @todo_list_name
    end

    def instruction
      @instruction
    end

    def valid?
      @valid
    end

  end
end
