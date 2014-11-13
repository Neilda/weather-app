require 'sinatra'
require 'yahoo_weatherman'

def get_weather(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['text']
end

def get_temp(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['temp']
end

get '/' do
	erb :home
end
post '/weather' do
    post = params[:post]['location']
 
    @weather = get_weather(post)
 
    "#{@weather}"
    
    if (@weather == 'sunny')
        erb :sunny
    elsif (@weather == 'cloudy')
        erb :cloudy
    elsif (@weather == 'snowy')
        erb :snowy
    else
        erb :default
    end
end