ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

# require our Sinatra app
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# require our helper
require File.join(File.dirname(__FILE__), '.', 'features/web_helpers.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# tell Capybara about our app class
Capybara.app = Birthday
