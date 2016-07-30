require_relative 'testing_pool.rb'

class TesterMatcher
	attr_accessor :pool

	def initialize
		@pool = TestingPool.new
	end

	# Takes country shortcuts and an array of device Id's. Passing an array allows single or multiple selection.
	def match(country_list = [], devices_list = [])
		return [] if country_list.nil? or devices_list.nil?
		
		country_list = countries if country_list.include?("All")

		devices_list = @pool.devices_map.keys if devices_list.include?("All")
		
		testers_list = testers.find_all {|tester| country_list.include? (tester.country) and tester.devices.any? {|device| devices_list.include? (device)}}
		testers_list.sort_by { |tester| tester.devices_bugs(tester.devices&devices_list)}.reverse
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

