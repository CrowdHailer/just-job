class Task
  module Repository
    @contents = []
    def self.for_todo_list(name)
      contents.select { |task| task.todo_list == name }
    end

    def self.contents
      @contents
    end

    def self.add(task)
      contents << task
    end

    def self.remove(task)
      contents.delete_if { |t| t == task }
    end

    def self.clear
      contents.clear
    end

    def self.empty?
      contents.empty?
    end
  end
end
