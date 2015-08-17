class CreateTask
  module RequestInterface
    extend Interface
    def instruction
      if defined?(super)
        value = super
        raise Interface::InvalidReturn unless value.is_a? Instruction
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end

    def todo_list
      if defined?(super)
        value = super
        raise Interface::InvalidReturn unless value.is_a? TodoList
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end
  end
end
