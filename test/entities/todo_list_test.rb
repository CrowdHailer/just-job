require_relative '../test_config'

class TodoListTest < JustJobTest
  def test_todo_list_is_initialised_with_a_name
    name = TodoListName.new "my list"
    todo_list = TodoList.new name
    assert_equal name, todo_list.name
  end
end
