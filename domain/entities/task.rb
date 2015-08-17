class Task
  def initialize(todo_list, instruction, due_date=nil)
    @todo_list = todo_list
    @instruction = instruction
    @completed = false
    @due_date = due_date
  end

  attr_reader :todo_list
  attr_accessor :due_date, :instruction, :id
  def completed?
    @completed
  end

  def complete
    @completed = true
    self
  end

end
