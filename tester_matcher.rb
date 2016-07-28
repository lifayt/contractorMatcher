require_relative 'testing_pool.rb'

class TesterMatcher
	attr_accessor :pool

	def initialize
		@pool = TestingPool.new
	end

	# Takes country shortcuts and an array of device Id's
	def match(countries = [], devices = [])
		testers_list = testers.find_all {|tester| countries.include? (tester.country) and tester.devices.any? {|device| devices.include? (device)}}
		testers_list.sort_by { |tester| tester.devices_bugs(tester.devices&devices)}.reverse
	end 

	def testers
		@pool.testers
	end

end

matcher = TesterMatcher.new

puts "Now comes the output ----------\n\n"

country = ["US", "GB"]
devices = ["1", "5", "6"]
testers = matcher.match(country, devices)

testers.each do | tester |
	puts "#{tester.first_name}, #{tester.devices_bugs(tester.devices&devices)}"
end