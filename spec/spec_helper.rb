require_relative '../app'

ENV['RACK_ENV'] = 'test'
require 'rack/test'

ENV['REDISCLOUD_URL'] ||= 'redis://localhost/1'

RSpec.configure do |config|
  config.before(:each) do
    # The Redis wrapper should probably be abstracted, but at the moment it uses the Alert model
    Alert.destroy_all('*')
  end

  config.include Rack::Test::Methods
end