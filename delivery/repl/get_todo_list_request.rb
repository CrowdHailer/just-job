module REPL
  class GetTodoListRequest
    prepend GetTodoList::RequestInterface

    def initialize(name)
      @name = TodoListName.new name
    end

    def name
      @name
    end
  end
end
