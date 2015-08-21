require_relative '../entities/todo_list'
require_relative './create_todo_list/request_interface'

class CreateTodoList
  def initialize(request)
    RequestInterface.required_on! request
    if request.valid?
      @todo_list = TodoList.new request.name
      TodoList::Repository.add @todo_list
      @outcome = :create
    else
      @outcome = :bad_request
    end
    rescue TodoList::Repository::NameRegistered
      @outcome = :name_conflict
  end

  def result
    @todo_list
  end

  def outcome
    @outcome
  end
end
