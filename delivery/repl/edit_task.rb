module REPL
  class EditTask

    def initialize(id, instruction:)
      request = EditTaskRequest.new id, instruction: instruction
      response = ::EditTask.new request

      case response.outcome
      when :updated
        puts "Task #{response.result.id} updated, instruction: '#{response.result.instruction}'"
      when :bad_request
        puts "Request had invalid details"
      when :not_found
        puts "Task with id '#{id}' not_found"
      end
    end

  end
end
