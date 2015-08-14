require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/create_todo_list'

class CreateTodoListTest < JustJobTest
  def test_can_create_a_todo_list
    request = OpenStruct.new :name => "my list"
    response = CreateTodoList.new request
    assert_kind_of TodoList, response.result
  end

end
