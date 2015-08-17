require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/edit_task'
require_relative '../../delivery/repl/edit_task_request'

class EditTaskTest < JustJobTest
  def test_can_edit_task_instruction
    request = REPL::EditTaskRequest.new old_task.id, instruction: "eat pie"
    response = EditTask.new request
    assert_equal "eat pie", response.result.instruction.to_s
  end

  def test_can_edit_task_due_date
    request = REPL::EditTaskRequest.new old_task.id, due_date: DateTime.new(2015, 9, 12, 10)
    response = EditTask.new request
    assert_equal DateTime.new(2015, 9, 12, 10), response.result.due_date
  end

  def old_task
    create_my_list
    request = REPL::CreateTaskRequest.new "my list", "Do laundrys"
    response = CreateTask.new request
    response.result
  end

  def test_raises_error_if_not_given_request_with_correct_interface
    assert_raises Interface::NotImplemented do
      EditTask.new OpenStruct.new
    end
  end
end
