require 'sinatra/base'

# Load all controllers and models
Dir.glob('./{controllers,models}/*.rb').each{
	|file| require file
}

require './app'
run Sinatra::Application