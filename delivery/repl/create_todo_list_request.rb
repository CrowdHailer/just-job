module REPL
  class CreateTodoListRequest
    prepend CreateTodoList::RequestInterface

    def initialize(name)
      @name = TodoListName.new name
    end

    attr_reader :name
  end
end
