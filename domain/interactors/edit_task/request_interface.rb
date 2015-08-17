class EditTask
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

    def task
      if defined?(super)
        value = super
        raise Interface::InvalidReturn, value.class unless value.is_a? Task
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end
  end
end
