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