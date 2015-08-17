module REPL
  class GetTodoListRequest
    prepend GetTodoList::RequestInterface

    def initialize(name)
      # Not this will fail when called as is not a TodoListName object
      # However will fail with helpful interface error
      @name = TodoListName.new name
    end

    def name
      @name
    end
  end
end
