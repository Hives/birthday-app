ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

# require our Sinatra app
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# tell Capybara about our app class
Capybara.app = Birthday
