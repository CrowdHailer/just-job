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
