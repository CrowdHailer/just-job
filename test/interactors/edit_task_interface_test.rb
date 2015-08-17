require_relative '../../domain/interface'
class EditTask
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

    def test_raises_error_when_request_object_does_not_have_task_method
      request_class = Class.new do
        prepend RequestInterface
      end
      err = assert_raises Interface::MissingMethod do
        request_class.new.task
      end
    end

    def test_raises_error_when_request_task_returns_invalid_type
      request_class = Class.new do
        prepend RequestInterface
        def task
          "String"
        end
      end
      err = assert_raises Interface::InvalidReturn do
        request_class.new.task
      end
    end

    def test_returns_value_when_it_is_a_task_task
      task = Task.new "my list", "This but also that"
      request_class = Class.new do
        prepend RequestInterface
        define_method :task do
          task
        end
      end
      assert_equal task, request_class.new.task
    end
  end
end
