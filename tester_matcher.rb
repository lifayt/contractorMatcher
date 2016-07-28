require_relative 'testing_pool.rb'

class TesterMatcher
	attr_accessor :pool

	def initialize
		@pool = TestingPool.new
	end

	# Takes country shortcuts and an array of device Id's
	def match(country, devices = [])
		testers_list = testers.find_all {|testers| testers.country == country and testers.devices.any? {|device| devices.include? (device)}}
	end 

	def testers
		@pool.testers
	end

end

matcher = TesterMatcher.new

matcher.testers.each do |tester| 
	puts tester.id
	puts tester.first_name
	puts tester.last_name
	puts tester.country
	puts tester.last_login
	puts tester.devices
	puts "\n"
end

puts "Now comes the output ----------\n\n"
puts matcher.match("US", "1")