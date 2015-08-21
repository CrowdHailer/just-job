require_relative './get_tasks/request_interface'

class GetTasks
  def initialize(request)
    RequestInterface.required_on! request
    if request.valid?
      todo_list = TodoList::Repository[request.todo_list_name]
      unless todo_list
        @outcome = :not_found
        return
      end
      @tasks = Task::Repository.for_todo_list todo_list
      @outcome = :found
    else
      @outcome = :bad_request
    end
  end

  def result
    @tasks
  end

  def outcome
    @outcome
  end
end
