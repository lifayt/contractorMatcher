require 'sinatra'
require_relative 'tester_matcher.rb'

MATCHER = TesterMatcher.new

get '/' do 
	erb :index, :locals => {'matcher' => MATCHER}
end

post '/search/' do

	countries = params["country"]

	devices = params["devices"]

	testers = MATCHER.match(countries, devices)

	erb :search, :locals => {'testers' => testers, 'matcher' => MATCHER}

end

get '/search/' do 

	erb :search, :locals => {'testers' => [], 'matcher' => MATCHER}

end

