require_relative '../../test_config'
require_relative '../../../domain/entities/todo_list'
require_relative '../../../domain/entities/todo_list/repository'

class TodoList
  class RepositoryTest < JustJobTest
    def test_returns_empty_collection_when_no_todo_lists
      assert_empty Repository.all
    end

    def test_can_add_a_todo_list
      todo_list = TodoList.new :default_name
      Repository.add todo_list
      refute Repository.empty?
    end

    def test_can_clear_repository
      todo_list = TodoList.new :default_name
      Repository.add todo_list
      Repository.clear
      assert Repository.empty?
    end

  end
end
