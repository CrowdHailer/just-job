module REPL
  class CompleteTasks

    def initialize(ids)
      request = CompleteTasksRequest.new ids
      response = ::CompleteTasks.new request
      puts "Completed tasks: #{response.result.map do |task| task.instruction.to_s end}"
    end

  end
end
