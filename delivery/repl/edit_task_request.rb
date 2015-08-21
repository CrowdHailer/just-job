module REPL
  class EditTaskRequest
    prepend EditTask::RequestInterface

    def initialize(id, instruction: nil, due_date: nil)
      @task = Task::Repository[id]
      @instruction =  instruction ? Instruction.new(instruction) : @task.instruction
      @due_date = due_date
      @valid = true
    rescue ArgumentError
      @valid = false
    end

    def task
      @task
    end

    def instruction
      @instruction
    end

    def due_date
      @due_date
    end

    def valid?
      @valid
    end

  end
end
