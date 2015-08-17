require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/get_todo_list'
require_relative '../../delivery/repl/get_todo_list_request'

class GetTodoListTest < JustJobTest
  def test_can_fetch_all_tasks_in_my_todo_list
    my_task = Task.new TodoListName.new("my list"), Instruction.new("take the high road")
    Task::Repository.add my_task
    your_task = Task.new TodoListName.new("your list"), Instruction.new("take the low road")
    Task::Repository.add your_task
    request = REPL::GetTodoListRequest.new "my list"
    response = GetTodoList.new request
    todo_list = response.result
    assert_includes todo_list, my_task
    refute_includes todo_list, your_task
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      GetTodoList.new OpenStruct.new
    end
  end
end
