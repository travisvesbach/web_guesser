require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)

get '/' do
	guess = params['guess'].to_i
	output = check_guess(guess)
	erb :index, :locals => {:number => @@number, :output => output}
end

def check_guess(guess)
	if guess > @@number and guess <= @@number + 5
		output = "Too high!"
	elsif guess > @@number + 5
		output = "Way too high!"
	elsif guess < @@number and guess >= @@number - 5
		output = "Too low!"
	elsif guess < @@number - 5
		output = "Way too low!"
	elsif guess == @@number
		output = "You got it right!"
	end
	output
end