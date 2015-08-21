class CreateTask
  module RequestInterface
    extend Interface
    def instruction
      if defined?(super)
        value = super
        raise Interface::InvalidReturn, value.class unless value.is_a? Instruction
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end

    def todo_list_name
      if defined?(super)
        value = super
        raise Interface::InvalidReturn, value.class unless value.is_a? TodoListName
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end
  end
end
