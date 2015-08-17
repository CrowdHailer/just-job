class CompleteTasks
  module RequestInterface
    extend Interface
    def tasks
      if defined?(super)
        value = super
        raise Interface::InvalidReturn unless value.is_a?(Array) 
        value
      else
        raise Interface::MissingMethod, "method '#{__method__}' is not implemented on #{self}"
      end
    end

  end
end
