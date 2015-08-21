module REPL
  class DeleteTaskRequest

    def initialize(id)
      if @task = Task::Repository[id]
        @valid = true
      else
        @valid = false
      end
    end

    def task
      @task
    end

    def valid?
      @valid
    end
  end
end
