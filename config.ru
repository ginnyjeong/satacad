ENV['RACK_ENV'] = "development"

require 'rubygems'
require 'bundler/setup'

require './app'
run Sinatra::Application