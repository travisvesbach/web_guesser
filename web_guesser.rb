require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)
@@counter = 6

get '/' do
	number = @@number
	guess = params['guess'].to_i
	output = check_guess(guess)
	if params['cheat'] == true
		cheat = true
	end

	if output == "You got it right!"
		@@number = rand(100)
		@@counter = 5
	elsif @@counter == 1
		@@number = rand(100)
		@@counter = 5
		output = "You are out of guesses! A new number has been generated!"
	else
		@@counter -= 1
	end

	erb :index, :locals => {:number => number, :output => output}

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