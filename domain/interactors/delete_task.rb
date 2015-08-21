class DeleteTask
  def initialize(request)
    if request.valid?
      task = request.task
      Task::Repository.remove task
      @outcome = :deleted
    else
      @outcome = :not_found
    end
  end

  def result
    true
  end

  def outcome
    @outcome
  end
end
