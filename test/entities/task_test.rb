require_relative '../test_config'

class TaskTest < JustJobTest
  def test_task_is_initialized_with_todo_list
    assert_equal "My List", new_task.todo_list
  end

  def test_task_is_initialized_with_instruction
    assert_equal "Get to the Chopper", new_task.instruction
  end

  def test_task_is_initialized_not_completed
    refute new_task.completed?
  end

  def test_task_can_get_completed
    task = new_task.complete
    assert task.completed?
  end

  def test_task_by_default_doesnt_have_a_due_date
    refute new_task.due_date
  end

  def test_can_be_created_with_due_date
    task = Task.new "My List", "Move the thing", DateTime.new(2015,8,14,10,30)
    assert_equal DateTime.new(2015,8,14,10,30), task.due_date
  end

  def new_task
    task = Task.new "My List", "Get to the Chopper"
  end
end
