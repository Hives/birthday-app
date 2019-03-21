ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

# require our Sinatra app
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# require our helper
require File.join(File.dirname(__FILE__), '.', 'features/web_helpers.rb')

# tell Capybara about our app class
Capybara.app = Birthday
