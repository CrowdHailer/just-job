require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/delete_task'

class DeleteTaskTest < JustJobTest

  def test_task_can_be_remove_from_todo_list
    create_my_list
    request = REPL::CreateTaskRequest.new "my list", "Do laundrys"
    response = CreateTask.new request
    task = response.result
    Task::Repository.add task
    request =  OpenStruct.new :task => task
    DeleteTask.new request
    assert Task::Repository.empty?
  end

end
