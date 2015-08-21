module REPL
  class CreateTodoList

    def initialize(*args)
      request = CreateTodoListRequest.new(*args)
      response = ::CreateTodoList.new request
      case response.outcome
      when :created
        puts "Created new TodoList '#{response.result.name}''"
      end
    end

  end
end
