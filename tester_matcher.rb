require_relative 'testing_pool.rb'

class TesterMatcher
	attr_accessor :pool

	def initialize
		@pool = TestingPool.new
	end

	# Takes country shortcuts and an array of device Id's. Passing an array allows single or multiple selection.
	def match(countries = [], devices = [])
		testers_list = testers.find_all {|tester| countries.include? (tester.country) and tester.devices.any? {|device| devices.include? (device)}}
		testers_list.sort_by { |tester| tester.devices_bugs(tester.devices&devices)}.reverse
	end 

	def testers
		@pool.testers
	end

	def countries
		countries = []
		testers.each do |tester|
			unless countries.include?(tester.country)
				countries.push(tester.country)
			end 
		end 
		return countries
	end

end

