module REPL
  class GetTasks

    def initialize(todo_list: )
      request = GetTasksRequest.new todo_list: todo_list
      response = ::GetTasks.new request

      case response.outcome
      when :found
          response.result.each do |task|
            puts "#{task.id}: #{task.instruction}"
          end
      when :bad_request
        puts "Request had invalid details"
      when :not_found
        puts "TodoList with name '#{request.todo_list_name}' not_found"
      end
    end

  end
end
