module REPL
  class CreateTodoListRequest
    prepend CreateTodoList::RequestInterface

    def initialize(name)
      # Not this will fail when called as is not a CreateTodoListName object
      # However will fail with helpful interface error
      name
    end
  end
end
