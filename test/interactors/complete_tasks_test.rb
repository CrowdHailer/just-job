require_relative '../test_config'
require 'ostruct'

require_relative '../../domain/interactors/complete_tasks'

class CompleteTasksTest < JustJobTest
  def test_can_complete_both_tasks
    request = OpenStruct.new :tasks => [task1, task2]
    response = CompleteTasks.new request
    assert response.result.first.completed?
    assert response.result.last.completed?
  end

  def task1
    Task.new "new list", "fry eggs"
  end

  def task2
    Task.new "new list", "fry bacon"
  end

end
