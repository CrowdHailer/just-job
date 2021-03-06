class GetTasks
  module RequestInterface
    extend Interface
    def todo_list_name
      if defined?(super)
        value = super
        raise Interface::InvalidReturn unless value.is_a?(TodoListName)
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end

  end
end
