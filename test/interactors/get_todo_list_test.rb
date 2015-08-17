require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/get_todo_list'
require_relative '../../delivery/repl/get_todo_list_request'

class GetTodoListTest < JustJobTest
  def test_can_todo_list
    create_my_list
    
    request = REPL::GetTodoListRequest.new "my list"
    response = GetTodoList.new request
    assert_equal "my list", response.result.name.to_s
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      GetTodoList.new OpenStruct.new
    end
  end
end
