require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/delete_task'
require_relative '../../delivery/repl/delete_task_request'

class DeleteTaskTest < JustJobTest

  def test_task_can_be_remove_from_todo_list
    create_my_list
    request = REPL::CreateTaskRequest.new "my list", "Do laundrys"
    response = CreateTask.new request
    task = response.result
    request =  REPL::DeleteTaskRequest.new task.id
    DeleteTask.new request
    assert Task::Repository.empty?
  end

end
