module REPL
  class CreateTaskRequest
    prepend CreateTask::RequestInterface

    def initialize(todo_list_name, instruction)
    end

    def todo_list
      TodoList.new :default_list
    end

    def instruction
      Instruction.new :default_instruction
    end

  end
end
