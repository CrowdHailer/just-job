require_relative '../../domain/interface'
class CompleteTasks
  class RequestInterfaceTest < JustJobTest
    def test_raises_error_when_request_object_does_not_have_tasks_method
      request_class = Class.new do
        prepend RequestInterface
      end
      err = assert_raises Interface::MissingMethod do
        request_class.new.tasks
      end
    end

    def test_raises_error_when_request_tasks_returns_invalid_type
      request_class = Class.new do
        prepend RequestInterface
        def tasks
          "String"
        end
      end
      err = assert_raises Interface::InvalidReturn do
        request_class.new.tasks
      end
    end

    def test_returns_value_when_it_is_a_list_of_task_ids
      tasks = [12, 10]
      request_class = Class.new do
        prepend RequestInterface
        define_method :tasks do
          tasks
        end
      end
      assert_equal tasks, request_class.new.tasks
    end
  end
end
