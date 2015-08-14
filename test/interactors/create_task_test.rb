require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/create_task'

class CreateTaskTest < JustJobTest
  def test_can_create_a_task
    request = OpenStruct.new :instruction => "Do something", :todo_list => "my list"
    response = CreateTask.new request
    assert_kind_of Task, response.result
  end

end
