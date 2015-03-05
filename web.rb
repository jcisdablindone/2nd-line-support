require 'rubygems'
require 'sinatra'
require_relative 'models/pingdom_api.rb'


get '/appsdown.json' do
	content_type :json
	PingdomApi.new.appsdown
end



post '/notify' do
  PingdomApi.new.notify(params[:payload])
end

