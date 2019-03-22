require 'sinatra/base'
require 'date'
require './lib/date_stuff.rb'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/is_it_your_birthday' do
    begin
      days_to_birthday = DateStuff.countdown(params[:day],
                                            params[:month])
    rescue ArgumentError
      redirect '/whoops' 
    end
    
    user_agent = request.env["HTTP_USER_AGENT"]
    session[:name] = params[:name] != "" ? params[:name] : user_agent
    session[:days_to_birthday] = days_to_birthday
    days_to_birthday.zero? ? (redirect '/birthday') : (redirect '/countdown')
  end

  get '/birthday' do
    @name = session[:name]
    erb :birthday
  end

  get '/countdown' do
    @days_to_birthday = session[:days_to_birthday]
    @name = session[:name]
    erb :countdown
  end

  get '/whoops' do
    erb :whoops
  end

end
