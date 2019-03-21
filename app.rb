require 'sinatra/base'
require 'date'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/birthday' do
    @name = params[:name]
    @birthday_day = params[:day]
    @birthday_month = params[:month]
    erb :birthday
  end
end
