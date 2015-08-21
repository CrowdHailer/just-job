require 'ostruct'
require 'awesome_print'
require './domain/interface'
Dir[File.expand_path('../domain/**/*.rb', __FILE__)].each {|file| require file }
Dir[File.expand_path('../delivery/repl/**/*.rb', __FILE__)].each {|file| require file }
