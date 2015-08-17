require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/create_todo_list'
require_relative '../../delivery/repl/create_todo_list_request'

class CreateTodoListTest < JustJobTest
  def test_can_create_a_todo_list_from_request
    request = REPL::CreateTodoListRequest.new "My list"
    response = CreateTodoList.new request
    assert_kind_of TodoList, response.result
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      CreateTodoList.new OpenStruct.new
    end
  end

end
