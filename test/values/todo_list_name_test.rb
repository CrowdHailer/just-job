require_relative '../test_config'
require_relative '../../domain/values/todo_list_name'

class TodoListNameTest < JustJobTest
  def test_can_be_initialized_with_a_valid_string
    assert_silent do
      TodoListName.new "Top 5 pies"
    end
  end

  def test_has_same_string_value_as_raw_value
    instruction = TodoListName.new "Top 5 pies"
    assert_equal "Top 5 pies", instruction.to_s
  end

  def test_cannot_be_created_with_less_than_2_charachters
    assert_raises ArgumentError do
      TodoListName.new "a"
    end
  end

  def test_cannot_be_created_with_more_than_80_charachters
    assert_raises ArgumentError do
      TodoListName.new "a" * 81
    end
  end

  def test_cannot_contain_angled_brackets
    assert_raises ArgumentError do
      TodoListName.new "<bad behaviour>"
    end
  end

  def test_is_equal_for_same_string
    todo_list_1 = TodoListName.new "Top 5 pies"
    todo_list_2 = TodoListName.new "Top 5 pies"
    assert_equal todo_list_1, todo_list_2
  end
end
