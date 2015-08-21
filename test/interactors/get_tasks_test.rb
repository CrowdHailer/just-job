require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/get_tasks'
require_relative '../../delivery/repl/get_tasks_request'

class GetTasksTest < JustJobTest
  def test_returns_array_for_empty_list
    create_my_list

    request = REPL::GetTasksRequest.new todo_list: "my list"
    response = GetTasks.new request
    assert_empty response.result
  end

  def test_returns_array_for_empty_list
    create_my_list

    request = REPL::CreateTaskRequest.new "my list", "Do something"
    response = CreateTask.new request
    task = response.result

    request = REPL::GetTasksRequest.new todo_list: "my list"
    response = GetTasks.new request
    assert_equal task, response.result.first
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      GetTasks.new OpenStruct.new
    end
  end
end
