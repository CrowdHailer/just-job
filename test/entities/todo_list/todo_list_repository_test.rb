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

    def test_can_fetch_todo_list_by_name
      todo_list = TodoList.new :default_name
      Repository.add todo_list
      assert_equal todo_list, Repository[:default_name]
    end

    def test_returns_nil_for_no_list
      todo_list = TodoList.new :default_name
      Repository.add todo_list
      assert_equal nil, Repository[:other_name]
    end

    def test_cannot_add_a_todo_list_with_the_same_name
      todo_list = TodoList.new :default_name
      Repository.add todo_list
      assert_raises Repository::NameRegistered do
        todo_list = TodoList.new :default_name
        Repository.add todo_list
      end
    end

  end
end
