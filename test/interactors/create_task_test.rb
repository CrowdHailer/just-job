require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/create_task'
require_relative '../../delivery/repl/create_task_request'

class CreateTaskTest < JustJobTest
  def setup
    super
    create_my_list
  end

  def test_can_create_a_task
    request = REPL::CreateTaskRequest.new "my list", "Do something"
    response = CreateTask.new request
    assert_kind_of Task, response.result
  end

  def test_created_task_is_added_to_todo_list
    request = REPL::CreateTaskRequest.new "my list", "Do laundry"
    response = CreateTask.new request

    request = REPL::GetTodoListRequest.new "my list"
    response = GetTodoList.new request
    tasks = Task::Repository.for_todo_list response.result
    refute tasks.empty?
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      CreateTask.new OpenStruct.new
    end
  end

end
