require 'ostruct'
Dir[File.expand_path('../domain/**/*.rb', __FILE__)].each {|file| require file }
