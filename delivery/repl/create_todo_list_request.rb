module REPL
  class CreateTodoListRequest
    prepend ::CreateTodoList::RequestInterface

    def initialize(name)
      @name = TodoListName.new name
      @valid = true
    rescue ArgumentError
      @valid = false
    end

    attr_reader :name

    def valid?
      @valid
    end
  end
end
