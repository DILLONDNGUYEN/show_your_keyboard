ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require "carrierwave"
require "carrierwave/orm/activerecord"
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

#Configuring Carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

require './app/controllers/application_controller'
require_all 'app'

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
