
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

	# @bugs is an array of arrays, where each row is a bug array containing [bug_id, device_id]
	def total_bugs
		@bugs.length
	end

	# tabulates total number of bugs for a given device.
	def device_bugs(device)
		bugs = 0
		@bugs.each do | row |
			if row[1] == device
				bugs += 1
			end
		end 
		return bugs
	end

end