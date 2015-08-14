class Task
  def initialize(todo_list, instruction, due_date=nil)
    @todo_list = todo_list
    @instruction = instruction
    @completed = false
    @due_date = due_date
  end

  attr_reader :instruction, :due_date, :todo_list
  def completed?
    @completed
  end

  def complete
    @completed = true
    self
  end

end
