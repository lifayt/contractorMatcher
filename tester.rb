
class Tester 

	attr_accessor :id, :first_name, :last_name, :country, :last_login, :devices, :bugs

	def initialize(id, first_name, last_name, country, last_login) 
		@devices = []

		@bugs = []

		@id = id

		@country = country

		@first_name = first_name

		@last_name = last_name

		@last_login = last_login
	end 

	# @bugs is an array of arrays, where each row is an array of form:[bug_id, device_id]
	def total_bugs
		@bugs.length
	end

	# tabulates total number of bugs for a given device. Takes singular integer input or array input
	def devices_bugs(devices)
		bugs = 0
		@bugs.each do | row |
			if devices.include?(row[1])
				bugs += 1
			end
		end 
		return bugs
	end

end