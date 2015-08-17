class GetTodoList
  module RequestInterface
    extend Interface
    def name
      if defined?(super)
        value = super
        raise Interface::InvalidReturn unless value.is_a? TodoListName
        value
      else
        raise Interface::MissingMethod, "method 'name' is not implemented on #{self}"
      end
    end
  end
end
