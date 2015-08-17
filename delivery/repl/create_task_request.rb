module REPL
  class CreateTaskRequest
    prepend CreateTask::RequestInterface

    def initialize(todo_list_name, instruction)
      @todo_list = GetTodoList.new(GetTodoListRequest.new(todo_list_name)).result
      @instruction = Instruction.new instruction
    end

    def todo_list
      @todo_list
    end

    def instruction
      @instruction
    end

  end
end
