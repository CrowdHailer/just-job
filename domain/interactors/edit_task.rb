require_relative './edit_task/request_interface'
require_relative './edit_task/request_interface'

class EditTask
  def initialize(request)
    RequestInterface.required_on! request
    if request.valid?
      task = request.task
      if task.nil?
        @outcome = :not_found
        return
      end
      task.instruction = request.instruction
      task.due_date = request.due_date
      @task = task
      @outcome = :updated
    else
      @outcome = :bad_request
    end

  end

  def result
    @task
  end

  def outcome
    @outcome
  end
end
