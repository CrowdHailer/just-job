module REPL
  class DeleteTask

    def initialize(id)
      request = DeleteTaskRequest.new id
      response = ::DeleteTask.new request

      case response.outcome
      when :deleted
        puts "Task deleted"
      when :not_found
        puts "Task with id '#{id}' not_found"
      end
    end

  end
end
