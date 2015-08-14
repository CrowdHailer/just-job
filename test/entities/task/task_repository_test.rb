require_relative '../../test_config'
require_relative '../../../domain/entities/task'
require_relative '../../../domain/entities/task/repository'

class Task
  class RespositoryTest < JustJobTest
    def test_returns_empty_list_when_no_tasks
      assert_empty Task::Repository.for_todo_list "no list"
    end
  end
end
