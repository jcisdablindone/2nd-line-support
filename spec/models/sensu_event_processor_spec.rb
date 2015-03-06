require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../../models/sensu_event_processor'
require_relative '../fixtures/sensu_events'
require 'spec_helper'
require 'redis'

describe SensuEventProcessor do

	context 'sensu down event' do


		let(:event) 		{ sensu_down_event }
		let(:redis)			{ Redis.new }


		context 'no record in the database with the same key' do
			
			before(:each)  { redis.flushdb }

			it 'should record a new alert' do
				SensuEventProcessor.new(event).process
				expect(redis.keys('*').size).to eq 1
				fetched = Alert.fetch 'monitoring-01.mon-v/process-cron'
				expect(JSON.parse(fetched.value)).to eq(sensu_down_event_payload)
			end

			it 'should log that an event has been recieived'
		end

		context 'record with same key already exists in database' do
			it 'should not overwrite the existing record' do
				redis.set('monitoring-01.mon-v/process-cron', {'message' => 'test_message'}.to_json)
				SensuEventProcessor.new(event).process
				fetched = Alert.fetch 'monitoring-01.mon-v/process-cron'
				expect(JSON.parse(fetched.value)).to eq({'message' => 'test_message'})
			end
			
			it 'should log that an event has been recieved and a key already exists in the database'
		
		end
	end

	context 'sensu up event' do
		context 'a record with the same key already exists in the database' do 
			it 'should remove the record from the database'
			it 'should log that an up event has been received and the record deleted'
		end

		context 'no record in the databsa with the same key' do
			it 'should log that an up event was recieved with no matching record in the database'
		end
	end

end