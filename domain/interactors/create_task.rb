require_relative '../entities/task'

class CreateTask
  def initialize(request)

  end

  def result
    Task.new
  end
end
