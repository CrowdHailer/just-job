require_relative './get_tasks/request_interface'

class GetTasks
  def initialize(request)
    RequestInterface.required_on! request
    request.valid?

    @todo_list = TodoList::Repository[request.todo_list_name]
    @tasks = Task::Repository.for_todo_list @todo_list
  end

  def result
    @tasks
  end
end
