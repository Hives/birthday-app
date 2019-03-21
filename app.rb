require 'sinatra/base'
require 'date'
require './lib/birthday_calc.rb'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/is_it_your_birthday' do
    days_to_birthday = BirthdayCalc.countdown(params[:day],
                                               params[:month])
    session[:name] = params[:name]
    session[:days_to_birthday] = days_to_birthday
    days_to_birthday.zero? ? (redirect '/birthday') : (redirect '/countdown')
  end

  get '/birthday' do
    @name = session[:name]
    erb :birthday
  end

  get '/countdown' do
    days_to_birthday = session[:days_to_birthday]
    @name = session[:name]
    @days_string = "#{days_to_birthday} day"
    @days_string += "s" if days_to_birthday > 1
    erb :countdown
  end
end
