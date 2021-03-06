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

    def test_added_task_gets_given_id
      task = Task.new "my list", "take the high road"
      Repository.add task
      assert task.id, 'should have id'
    end

    def test_cant_add_a_task_twice
      task = Task.new "my list", "take the high road"
      Repository.add task
      assert_raises Repository::AlreadyAdded do
        Repository.add task
      end
    end

    def test_tasks_given_sequential_ids
      task1 = Task.new "my list", "take the high road"
      Repository.add task1
      task2 = Task.new "my list", "take the high road"
      Repository.add task2
      assert_operator task1.id, :<, task2.id
    end

    def test_should_be_able_to_retireve_task_by_id
      task = Task.new "my list", "take the high road"
      Repository.add task
      assert_equal task, Repository[task.id]
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
