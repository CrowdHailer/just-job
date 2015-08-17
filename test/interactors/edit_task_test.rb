require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/edit_task'

class EditTaskTest < JustJobTest
  def test_can_edit_task_instruction
    skip
    instruction =  Instruction.new "eat pie"
    request = OpenStruct.new task: old_task, :instruction => instruction
    response = EditTask.new request
    assert_equal instruction, response.result.instruction
  end

  def test_can_edit_task_due_date
    skip
    request = OpenStruct.new task: old_task, :due_date => DateTime.new(2015, 9, 12, 10)
    response = EditTask.new request
    assert_equal DateTime.new(2015, 9, 12, 10), response.result.due_date
  end

  def old_task
    request = OpenStruct.new :instruction => "Do laundry", :todo_list => Instruction.new("my list")
    response = CreateTask.new request
    response.result
  end

end
