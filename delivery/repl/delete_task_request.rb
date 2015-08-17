module REPL
  class DeleteTaskRequest

    def initialize(id)
      @task = Task::Repository[id]
    end

    def task
      @task
    end
  end
end
