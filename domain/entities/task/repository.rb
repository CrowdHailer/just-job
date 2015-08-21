class Task
  module Repository
    AlreadyAdded = Class.new(RuntimeError)
    @id = 0
    @contents = []
    def self.for_todo_list(todo_list)
      contents.select { |task| task.todo_list == todo_list }
    end

    def self.contents
      @contents
    end

    def self.[](id)
      contents.find{ |task| task.id == id }
    end

    def self.add(task)
      raise AlreadyAdded if task.id
      task.id = @id += 1
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
