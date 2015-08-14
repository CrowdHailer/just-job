require_relative '../test_config'
require 'ostruct'

class CreateTodoListTest < JustJobTest
  def test_can_create_a_todo_list
    request = OpenStruct.new :instruction => "my list"
    interaction = CreateTodoList.new request
    assert_kind_of TodoList, interaction.result
  end
end
