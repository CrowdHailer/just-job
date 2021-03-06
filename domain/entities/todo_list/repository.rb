require_relative '../../values/todo_list_name'

class TodoList
  module Repository
    NameRegistered = Class.new(ArgumentError)
    @contents = []

    def self.contents
      @contents
    end

    def self.add(todo_list)
      raise NameRegistered if self[todo_list.name]
      contents << todo_list
    end

    def self.[](name)
      contents.find{ |todo_list| todo_list.name == name }
    end

    def self.all
      contents
    end

    def self.empty?
      contents.empty?
    end

    def self.clear
      contents.clear
    end
  end
end
