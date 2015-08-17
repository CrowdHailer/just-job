require_relative '../../domain/interface'
class CreateTask
  class RequestInterfaceTest < JustJobTest
    def test_raises_error_when_request_object_does_not_have_instruction_method
      request_class = Class.new do
        prepend RequestInterface
      end
      err = assert_raises Interface::MissingMethod do
        request_class.new.instruction
      end
    end

    def test_raises_error_when_request_instruction_returns_invalid_type
      request_class = Class.new do
        prepend RequestInterface
        def instruction
          "String"
        end
      end
      err = assert_raises Interface::InvalidReturn do
        request_class.new.instruction
      end
    end

    def test_returns_value_when_it_is_an_instruction
      instruction = Instruction.new "This but also that"
      request_class = Class.new do
        prepend RequestInterface
        define_method :instruction do
          instruction
        end
      end
      assert_equal instruction, request_class.new.instruction
    end

    def test_raises_error_when_request_object_does_not_have_todo_list_method
      request_class = Class.new do
        prepend RequestInterface
      end
      err = assert_raises Interface::MissingMethod do
        request_class.new.todo_list
      end
    end

    def test_raises_error_when_request_todo_list_returns_invalid_type
      request_class = Class.new do
        prepend RequestInterface
        def todo_list
          "String"
        end
      end
      err = assert_raises Interface::InvalidReturn do
        request_class.new.todo_list
      end
    end

    def test_returns_value_when_it_is_a_todo_list_todo_list
      todo_list = TodoList.new "This but also that"
      request_class = Class.new do
        prepend RequestInterface
        define_method :todo_list do
          todo_list
        end
      end
      assert_equal todo_list, request_class.new.todo_list
    end
  end
end
