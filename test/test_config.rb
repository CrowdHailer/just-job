# Load our dependencies
require 'rubygems' unless defined?(Gem)
# Sets up all of load paths that are searched when requiring code
require 'bundler/setup'
# requires all gems for the current runtime enviroment
Bundler.require(:default, :test)

# Use a more pleasant reporter and show slowest tests
reporter_options = {color: true, slow_count: 5}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

# require all test support files
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |file| require file}

class JustJobTest < Minitest::Test
  # Generic test case for the Just Job project
  def setup
    Task::Repository.clear
    TodoList::Repository.clear
  end

  def create_my_list
    request = REPL::CreateTodoListRequest.new "my list"
    response = CreateTodoList.new request
  end
end
