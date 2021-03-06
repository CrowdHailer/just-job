Just Job
========

#### Just Job is a todo list built from the ground up using the principles of [Domain Driven Design(DDD)](http://insights.workshop14.io/2015/07/14/domain-driven-design-introduction.html) that I have been recently exploring.

## Why
Domain Driven Design is often seen as only relevant in more complicated application, which a todo list is definetly not.
However what happens when you have a simple application that grows in complexity.
I contest that there is no simple switchover between when DDD is overkill and when it is a good idea.
This project aims to build the most simple application using DDD and show how easy it is to add interesting behaviour.

I will also employ Test Driven Development for this project.
I will also add my own acronym **ForCS**.

> DDD + TDD = FORCS, FORmalised Common Sense. *pronounced forks*#

## Features

## Install

#### Clone the app

```
git clone git@github.com:CrowdHailer/just-job.git
cd Maenporth
```

#### Install Ruby Gem Dependencies

```
bundle install
```

#### Run tests

```
bundle exec rake test
```

## Usage

### Via REPL

Start irb with `boot.rb` required to include the REPL delivery and application domain.

```
$ irb -r ./boot.rb
```

Create a todo list with a todo list name.
The interaction is show as a message.
```rb
# For valid input
REPL::CreateTodoList.new "My list"
"Created new TodoList 'My list'"
# => #<REPL::CreateTodoList:0x00000001f03470>

# For invalid name
REPL::CreateTodoList.new "a"
"Request had invalid name 'a'"
# => #<REPL::CreateTodoList:0x000000009bf780>

# For taken name
REPL::CreateTodoList.new "My list"
"TodoList name 'My list' already taken"
# => #<REPL::CreateTodoList:0x000000009c9c30>
```

Create a task in a todo list.
Todo lists are identified by name
```rb
# Add task to list
REPL::CreateTask.new "My list", "Clean windows"
"Task added 'Clean windows'"
# => #<REPL::CreateTask:0x00000000ac82f8>

# Instruction invalid
REPL::CreateTask.new "My list", "C"
"Request had invalid details"
# => #<REPL::CreateTask:0x00000000aa4b28>

# List not created
REPL::CreateTask.new "no list", "Clean windows"
"TodoList with name 'no list' not_found"
# => #<REPL::CreateTask:0x00000000a69cd0>
```

Get a todo list.
passed as option as will will extend with pagination
```rb
# For existing todo list
REPL::GetTasks.new todo_list: "My list"
"1: Clean windows"
"2: Wash dishes"
# => #<REPL::GetTasks:0x000000014a44c0>

REPL::GetTasks.new todo_list: "M"
"Request had invalid details"
# => #<REPL::GetTasks:0x0000000147b6d8>

REPL::GetTasks.new todo_list: "Daves list"
"TodoList with name 'Daves list' not_found"
# => #<REPL::GetTasks:0x00000001443940>
```

Edit a task
```rb
# For existing task
REPL::EditTask.new 1, instruction: "Move boxes"
Task 1 updated, instruction: 'Move boxes'
# => #<REPL::EditTask:0x0000000218d330>

# For non existant task
REPL::EditTask.new 4, instruction: "Move boxes"
Task with id '4' not_found
# => #<REPL::EditTask:0x00000002150598>

# For invalid request
REPL::EditTask.new 4, instruction: "M"
Request had invalid details
# => #<REPL::EditTask:0x00000002106498>
```

Delete a Task
```rb
REPL::DeleteTask.new 1
"Task deleted"
# => #<REPL::DeleteTask:0x00000000dee158>
REPL::DeleteTask.new 1
"Task with id '1' not_found"
# => #<REPL::DeleteTask:0x00000000dcacd0>
```

Complete task
```rb
REPL::CompleteTasks.new [1, 2]
'Completed tasks: ["Clean windows"]'
# => #<REPL::CompleteTasks:0x00000001b6def0>
```

## Development

###  Overview
The application will be developed one user case at a time, but we will assume a reasonable specification so can forward plan for some features.
Our data persistence mechanism is just a detail and descisions about it will be deferred as long as possible.
The delivery mechanism is also a detail and we will not allow it to pollute the domain model.
Instead of dependency injection I want to use interface objects as described in "Architecture: the lost years".
However I have never worked in a language with proper interface objects so if I get it all wrong please let me know.

### Creating a new Task

> It should be possible to add a new task to a todo list

**Requirements**
- a task has an instruction(the content), a due_date and a completed status
- we need to be able to create a todo list
- a todo list has a name

**1: Failing interactor test**

```rb
class CreateTodoListTest < JustJobTest
  def test_can_create_a_todo_list
    request = OpenStruct.new :name => "my list"
    response = CreateTodoList.new request
    assert_kind_of TodoList, response.result
  end
end
```

The interactor(`CreateTodoList`) takes a generic request object with all the data needed to complete the interaction.
It returns a generic response object(instance of `CreateTodoList`) with some result, here the result is a `TodoList`

**2: create a TodoList object**  
To make the above test pass we have to create minimal `CreateTodoList` and `TodoList` classes

**3: complete requirements**  
Repeat adding interactor tests and writing the code to fix them. See the commit log for details

At this point our task item is just able to hold the `todo_list` as a string and we have not needed to implement any functionality on the todo_list

### Modifying a task

> It should be possible to complete edit or delete a task

**Requirements**  
- edit instructions and/or due_date
- complete one or more tasks
- delete a task

**1: Failing interactor test**  
Write a test for the edit_task interactor

**2: create an EditTask interactor**  
Create an edit task interactor and update the task entity

**3: Implement complete_tasks**  
Write a test for the complete_tasks interactor and create interactor

**4: Implement list tasks**  
We cannot confirm that a task is deleted if we are not able to list the tasks.
So we will add the requirement to be able to list tasks for the next step.

At this point our app is able to create, edit and complete tasks but not yet delete or list tasks

## Fetching a todo list
> it should be able to view all the tasks in a todo list

###### Requirements
- fetch a todo list by its name
- check a task has been removed

###### Steps
1. Failing interactor test  
Write a failing test for the `GetTodoList` interactor.
The TodoLists will be identified by their name so that is what we use to fetch the todolist

2. Create Tasks Repository
At this point we need to have a record of all the tasks in our system.
For this we will create a [repository](http://insights.workshop14.io/2015/08/09/untangle-your-domain-model-from-the-database.html), at this stage it only needs to be in memory
A repository always models a collection of entities therefore we do not need to have a separate repositories directory.

3. Failing remove task interactor test
we should be able to remove a task from the repository

4. implement repository remove methods

5. change create task to add to repository

## Booting the application
We now have six usecase that our application supports.
- create task
- edit task
- complete tasks
- delete tasks
- get todo list
- create todo list
The last one is a bit odd at this point because tasks don't validate that a list exits when they are created.
The fact that most of these usecase only work for a happy path does not prevent us from having enough functionality for a working app.

To make this app bootable all we need to do is require the domain.

1. Make a `boot.rb`

Usage to start a shell in the application execute
```sh
$ irb -r ./boot.rb
```

You can then use each interactor to control the application
```rb
request = OpenStruct.new :instruction => 'shout huzzar!', :todo_list => 'my list'

response = CreateTask.new request

request = OpenStruct.new :name => "My list"

response = GetTodoList.new request

task = response.result.first

puts task.instruction
# => "shout huzzar!"

puts task.completed?
#=> false

CompleteTasks.new(OpenStruct.new(:tasks => [task]))

puts task.completed?
#=> true

```

## Version 2 - Securing the application
Our application so far responds to all the happy paths that we have required.
However there is no validation within the system, tasks can have no contents, anything can be added to a todo list.

*NB this is not user related security, we have no concept of a user, we are just ensuring we handle interactions off the happy path*

Some of the things we might like
- validating task instruction is not nil, hash a certain length and contains only allowed characters
- a task can be added only to an existing todo list and not be given any string

###### Steps
1. Creating an instruction object.
Strings can be any length and contain any character, as our instruction is not of any length and cannot contain all characters it is best represented by a something other than a string.
See a discussion on [value objects](http://insights.workshop14.io/2015/07/15/value-objects-in-ruby.html).

Value objects are used throughout the application and so we will put them in there own directory
Our instruction object is only valid for strings more than 1 character and less than 256 characters long.
It also validates the string does not contain any angled brackets (`<>`)

2. Update tests to use instruction value
use the instruction object when instantiating interactors.
We will not code defensively to ensure interactors are given the right value objects.
Later we will introduce form objects as boundary control between the app and delivery mechanism

3. Create a repository of todo lists
This is necessary as to pass a todolist to create a task it must be possible to have an empty todo.

At this point the todo_lists driving all developments from the interactor level down seams heavy handed. Feature development is best driven from this level but certain features must be present on the domain objects and you do not always need a usecase to see this. So carrying on at the unit test level

4. Todo list names must be unique in the repository.
throw an error if adding the same name twice.

Our application now checks for many more types of errors.
task instructions are limited
todo list names are limited
todo lists cannot be duplicated in the repository

However for most of those constraints it is possible to circumnavigate them by providing incorrect input. ie just passing a string rather than a todo list name.

## Version 3 - Providing an interface
As a ruby developer I do not want to be type checking all through my system.
To deal with unsafe input I will create an object that is responsible for coercing and validating input for a given interactor.
The interactor will just check that it is given one of these objects.
I have written about these objects [calling them form objects](http://insights.workshop14.io/2015/07/23/application-border-control-with-ruby-form-objects.html).
This is because the often validate form input but they are not limited to forms.
**In this iteration I will be calling these form objects request objects**
this is the terminology used by uncle bob in clean architecture

This interface will eventually be used by the delivery mechanism, likely but not definetly the web.
To show that the interface is reusable we will also write a simple ruby implementation, which makes using the application from within an irb session easier.

###### Steps
1. Create todo list interface
Any request object to this interactor must have a name method that returns an instance of `TodoListName`

2. Test the interactor accepts only request with the interface.
At this point we introduce the REPL(irb) as a delivery mechanism.
With request objects growing in complexity it gets more cumbersome to generate them in irb.
For this reason I create request implementations designed for use in the repl.
They also make setup for tests much easier
```rb
request = OpenStruct.new(:name => TodoListName.new("My list"))
# has been replaced with
request = REPL::CreateTodoListRequest.new "My list"
```

```rb
class CreateTodoList
  def initialize(request)
    RequestInterface.required_on! request
  end
  # rest
end
```

3. Implement the get todo list interface
Also create a REPL implementation, and test that interactor accepts only interface

This change is also necessary as we have updated the `CreateTodoList` interactor to only accept the correct interface

4. Upgrade the create task interactor
When adding the create task interface we want a new task to be given a todolist as an identifier and not just any value.
A todolist cannot be passed into the request object, the request object must be initialized with only primitives.
Therefore this request object will have to use the `GetTodoList` interactor.
The request object implementation is outside the domain and so must only query the domain through interactors.

5. Implement the remaining interfaces
The interactor tests have become the integration tests.
They should be set up using other interactors.
We will switchover to using interactors as they become available.

6. Add id to task so that we do not need to pass task objects to the delivery mechanism
repository needs to assign id when adding task

7. delete task interactor only needs to take an id so this request is duck typed and not interface checked for comparison.

The application at this point has much of the core functionality, even if that is a very limited set of functionality at the moment.
The interactors have a mechanism of validating and checking input.
The interfaces are written in a very verbose manner at the moment which is probably a reflection of the fact that it is not a natural thing to do in Ruby.
We have managed to get this far without deciding on a framework or database implementation, proving that we have been able to treat those as details.
As an aside the test run very fast but that is just an added bonus and not a core feature off this approach

> Finished tests in 0.008828s, 7815.9549 tests/s, 8382.3284 assertions/s.

The next step is probably to implement a web delivery mechanism plugin and see how easy it is to make use of the interfaces.
But first we will create some REPL actions to use with the domain these would be the representive of controller action in a web delivery.

8. create todo list action
usecases should have an outcome method.
our create actions have a created outcome for success cases.

9. create task action and remaining actions.

Creating actions, interactors, requestinterfaces and requests is a significant overhead on small projects like this, at least without any tools/gems

### Other examples
https://github.com/paulrayner/ddd_sample_app_ruby
https://github.com/emadb/ruby_loves_ddd
https://github.com/zamith/yaba/blob/master/README.md
