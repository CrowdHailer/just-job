module REPL
  class CreateTask

    def initialize(todo_list_name, instruction)
      request = CreateTaskRequest.new todo_list_name, instruction
      response = ::CreateTask.new request

      case response.outcome
      when :created
        puts "Task added '#{response.result.instruction}'"
      when :bad_request
        puts "Request had invalid details"
      when :not_found
        puts "TodoList with name '#{todo_list_name}' not_found"
      end
    end

  end
end
