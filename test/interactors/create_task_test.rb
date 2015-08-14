require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/create_task'

class CreateTaskTest < JustJobTest
  def test_can_create_a_task
    request = OpenStruct.new :instruction => Instruction.new("Do something"), :todo_list => "my list"
    response = CreateTask.new request
    assert_kind_of Task, response.result
  end

  def test_created_task_is_added_to_repository
    request = OpenStruct.new :instruction => Instruction.new("Do something"), :todo_list => "my list"
    response = CreateTask.new request
    refute Task::Repository.empty?
  end

end
