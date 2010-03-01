# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
require 'spec/autorun'
require 'spec/rails'

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

require 'capybara/rails'
Capybara.default_selector = :css

class ActionController::TestCase
  def login(email, password)
    visit("/users/sign_in")
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click 'Sign in'
  end

  def logout
    visit("/home")
    click "Sign out"
  end
end

module Spec::Example::ExampleGroupMethods
  alias :scenario  :example
  alias :xscenario :xexample
end

module Spec::DSL::Main
  alias :story :describe
end

# Uncomment the next line to use webrat's matchers
#require 'webrat/integrations/rspec-rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  config.include Capybara

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end
