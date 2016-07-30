require 'csv'
require_relative 'tester.rb'
class TestingPool

	attr_accessor :testers, :devices_map

	def initialize
		@testers = []
		@devices_map = {}

		read_data
		create_testers
		create_device_map
		associate_devices
		associate_bugs
	end

	# Turns csv data into ruby arrays
	def read_data
		@testers_data = CSV.read("data/testers.csv")

		@testers_device_data = CSV.read("data/tester_device.csv")

		@devices_data = CSV.read("data/devices.csv")

		@bugs_data = CSV.read("data/bugs.csv")
	end

	# Inits testers from tester.csv
	def create_testers
		@testers_data.shift
		@testers_data.each do |row|
			tester_id = row[0]
			first_name = row[1]
			last_name = row[2] 
			country = row[3]
			last_login = row[4]
			tester = Tester.new(tester_id, first_name, last_name, country, last_login)
			@testers.push(tester)
		end
	end

	# Creates translation mapping used for turning device ids into english descriptions
	def create_device_map
		@devices_data.shift
		@devices_data.each do |row|
			device_id = row[0]
			device_description = row[1]
			devices_map[device_id] = device_description
		end 
	end
 
	# Associates testers with devices 
	def associate_devices
		@testers_device_data.shift
		@testers_device_data.each do |row|
			tester_id = row[0]
			device_id = row[1]
			relevant_tester = @testers.find {|tester| tester.id == tester_id }
			relevant_tester.devices.push(device_id)
		end
	end

	# Populates the bug class with a list of bugs
	def associate_bugs
		@bugs_data.shift
		@bugs_data.each do |row|
			bug_id = row[0]
			device_id = row[1] 
			tester_id = row[2]
			relevant_tester = @testers.find {|tester| tester.id == tester_id }
			relevant_tester.bugs.push([bug_id, device_id])
		end
	end 
end