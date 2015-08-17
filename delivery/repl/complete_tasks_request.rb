module REPL
  class CompleteTasksRequest
    prepend CompleteTasks::RequestInterface

    def initialize(task_ids)
      @tasks = task_ids.map { |id| Task::Repository[id] }
    end

    def tasks
      @tasks
    end
  end
end
