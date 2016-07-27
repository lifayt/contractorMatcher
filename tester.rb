
class Contractor 

	attr_accessor :id, :first_name, :last_name, :country, :lastLogin, :devices

	def initialize(id, country, first_name, last_name, lastLogin) 
		@devices = {}

		@id = id

		@country = country

		@first_name = first_name

		@last_name = last_name

		@lastLogin = lastLogin
	end 

	def total_bugs

	end

	def device_bugs(device)

	end

end