require_relative './edit_task/request_interface'
require_relative './edit_task/request_interface'

class EditTask
  def initialize(request)
    RequestInterface.required_on! request
    task = request.task
    task.instruction = request.instruction
    task.due_date = request.due_date
    @task = task
  end

  def result
    @task
  end
end
