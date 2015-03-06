require 'json'
require_relative 'alert'

class SensuEventProcessor

	def initialize(params)
		@payload = JSON.parse(params['event'])
		@key = "#{@payload['client']['name']}/#{@payload['check']['name']}"
	end



	def process
		if @payload['action'] == 'create'
			record_sensu_alert
		else
			remove_sensu_alert
		end
	end


	private

	def record_sensu_alert
		Alert.create(@key, @payload) unless Alert.exist?(@key)
	end

end