require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/complete_tasks'
require_relative '../../delivery/repl/complete_tasks_request'

class CompleteTasksTest < JustJobTest
  def test_can_complete_both_tasks
    # request = OpenStruct.new :tasks => [task1.id, task2.id]
    CreateTodoList.new(REPL::CreateTodoListRequest.new 'new list')
    request = REPL::CompleteTasksRequest.new [task1.id, task2.id]
    response = CompleteTasks.new request
    assert response.result.first.completed?
    assert response.result.last.completed?
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      CompleteTasks.new OpenStruct.new
    end
  end

  def task1
    CreateTask.new(REPL::CreateTaskRequest.new('new list', "fry eggs")).result
  end

  def task2
    CreateTask.new(REPL::CreateTaskRequest.new('new list', "fry bacon")).result
  end

end
