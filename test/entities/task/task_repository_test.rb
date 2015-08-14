require_relative '../../test_config'
require_relative '../../../domain/entities/task'
require_relative '../../../domain/entities/task/repository'

class Task
  class RepositoryTest < JustJobTest
    def test_returns_empty_list_when_no_tasks
      assert_empty Repository.for_todo_list "no list"
    end

    def test_can_add_a_task
      task = Task.new "my list", "take the high road"
      Repository.add task
      refute Repository.empty?
    end

    def test_can_remove_a_task
      task = Task.new "my list", "take the high road"
      Repository.add task
      Repository.remove task
      assert Repository.empty?
    end

    def test_can_clear_repository
      task = Task.new "my list", "take the high road"
      Repository.add task
      Repository.clear
      assert Repository.empty?
    end

    def test_returns_all_tasks_in_a_todo_list
      my_task = Task.new "my list", "take the high road"
      your_task = Task.new "your list", "take the low road"
      Repository.add my_task
      Repository.add your_task
      assert_equal [my_task], Repository.for_todo_list("my list")
    end

  end
end
