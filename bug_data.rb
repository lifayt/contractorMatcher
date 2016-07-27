

class BugData 
	attr_accessor :bug_data, :tester_profiles

	def initialize
		@bug_data = {}
	end

	# Bug data comes in the format {bug_id => {:device_id => device_id, :tester_id => tester_id}}
	# Takes a tester_id in, and returns a hash with bug specific data about the tester 
	def bug_totals_for_tester(tester)
		@tester_profiles[tester] = {:total_bugs => 0, :devices => {}}
		@bug_data.each do |key, value| 
			if value[:tester_id] == tester
				@tester_profiles[tester][:total_bugs] += 1
				

	end

	def bug_totals

	end

	def bug(id)
		@bug_data[id]
	end

end