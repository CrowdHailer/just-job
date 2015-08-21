module REPL
  class CreateTodoList

    def initialize(name)
      request = CreateTodoListRequest.new name
      response = ::CreateTodoList.new request
      
      case response.outcome
      when :created
        puts "Created new TodoList '#{response.result.name}'"
      when :bad_request
        puts "Request had invalid name '#{name}'"
      end
    end

  end
end
