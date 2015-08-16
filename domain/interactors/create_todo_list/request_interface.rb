require_relative '../../interface'
class CreateTodoList
  module RequestInterface
    def name
      raise Interface::MissingMethod, "method 'name' is not implemented on #{self}"
    end
  end
end
