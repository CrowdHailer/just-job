class TodoList
  module Repository
    @contents = []

    def self.contents
      @contents
    end

    def self.add(todo_list)
      contents << todo_list
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
