require 'sinatra'
require_relative 'tester_matcher.rb'

MATCHER = TesterMatcher.new

get '/' do 
	erb :index, :locals => {'matcher' => MATCHER}
end

post '/search/' do

	countries = params["country"]

	devices = params["devices"]

	puts "Params: #{params}"

	testers = MATCHER.match(countries, devices)

	erb :search, :locals => {'testers' => testers, 'matcher' => MATCHER}

end

get '/search/' do 

	erb :search, :locals => {'matcher' => MATCHER}

end

