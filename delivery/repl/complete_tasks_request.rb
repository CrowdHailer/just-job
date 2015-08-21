module REPL
  class CompleteTasksRequest
    prepend CompleteTasks::RequestInterface

    def initialize(task_ids)
      @tasks = task_ids.map { |id| Task::Repository[id] }.compact
    end

    def tasks
      @tasks
    end

    def valid?
      # empty array if invalid values
      true
    end
  end
end
