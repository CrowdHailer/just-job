require_relative '../test_config'
require 'ostruct'

# require_relative '../../domain/interactors/edit_task'

class GetTodoListTest < JustJobTest
  def test_can_fetch_all_tasks_in_my_todo_list
    request = OpenStruct.new :name => "my list"
    response = GetTodoList.new request
    todo_list = response.result
    assert_includes todo_list, my_task
    refute_includes todo_list, your_task
  end

  def my_task
    Task.new "my list", "take the high road"
  end

  def your_task
    Task.new "your list", "take the low road"
  end
end
