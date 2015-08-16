require_relative '../../values/todo_list_name'

class TodoList
  module Repository
    @contents = []

    def self.contents
      @contents
    end

    def self.add(todo_list)
      contents << todo_list
    end

    def self.[](name)
      contents.first{ |todo_list| todo_list.name = name }
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
