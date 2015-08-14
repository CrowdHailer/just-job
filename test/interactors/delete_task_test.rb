require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/delete_task'

class DeleteTaskTest < JustJobTest

  def test_task_can_be_remove_from_todo_list
    request = OpenStruct.new :instruction => "Do laundry", :todo_list => Instruction.new("my list")
    response = CreateTask.new request
    task = response.result
    Task::Repository.add task
    request =  OpenStruct.new :task => task
    DeleteTask.new request
    assert Task::Repository.empty?
  end

end
