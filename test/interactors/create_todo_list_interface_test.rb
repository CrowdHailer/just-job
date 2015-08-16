class CreateTodoList
  class RequestInterfaceTest < JustJobTest
    def test_raises_error_when_request_object_does_not_have_name_method
      request_class = Class.new do |x|
        prepend RequestInterface
      end
      assert_raises Interface::MissingMethod do
        request_class.new.name
      end
    end
  end
end
