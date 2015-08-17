require_relative '../../domain/interface'
class CreateTodoList
  class RequestInterfaceTest < JustJobTest
    def test_raises_error_when_request_object_does_not_have_name_method
      request_class = Class.new do
        prepend RequestInterface
      end
      err = assert_raises Interface::MissingMethod do
        request_class.new.name
      end
    end

    def test_raises_error_when_request_name_returns_invalid_type
      request_class = Class.new do
        prepend RequestInterface
        def name
          "String"
        end
      end
      err = assert_raises Interface::InvalidReturn do
        request_class.new.name
      end
    end

    def test_returns_value_when_it_is_a_todo_list_name
      todo_list_name = TodoListName.new "This but also that"
      request_class = Class.new do
        prepend RequestInterface
        define_method :name do
          todo_list_name
        end
      end
      assert_equal todo_list_name, request_class.new.name
    end
  end
end
