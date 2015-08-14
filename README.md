Just Job
========

#### Just Job is a todo list built from the ground up using the principles of [Domain Driven Design(DDD)](http://insights.workshop14.io/2015/07/14/domain-driven-design-introduction.html) that I have been recently exploring.

## Why
Domain Driven Design is often seen as only relevant in more complicated application, which a todo list is definetly not.
However what happens when you have a simple application that grows in complexity.
I contest that there is no simple switchover between when DDD is overkill and when it is a good idea.
This project aims to build the most simple application using DDD and show how easy it is to add interesting behaviour.

I will also employ Test Driven Development for this project.
DDD + TDD = FORCS, FORmalised Common Sense. *pronounced forks*

## Overview
The application will be developed one user case at a time, but we will assume a reasonable specification so can forward plan for some features.
Our data persistence mechanism is just a detail and descisions about it will be deferred as long as possible.
The delivery mechanism is also a detail and we will not allow it to pollute the domain model.
Instead of dependency injection I want to use interface objects as described in "Architecture: the lost years".
However I have never worked in a language with proper interface objects so if I get it all wrong please let me know.

## Development
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
A repository always models a collection of entities therefore we do not need to have a separate respositories directory.

3. Failing remove task interactor test
we should be able to remove a task from the repository

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
