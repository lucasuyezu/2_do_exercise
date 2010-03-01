# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'warden', :version => '0.9.3'
  config.gem 'devise', :version => '1.0.2'
  config.gem "inherited_resources", :version => "= 1.0.3"
  config.gem "carrierwave"
  config.gem "sqlite3-ruby", :lib => "sqlite3"
  config.gem "rmagick"

  config.time_zone = 'UTC'
  config.i18n.default_locale = :en
end
