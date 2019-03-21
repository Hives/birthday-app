require 'sinatra/base'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/birthday' do
    @name = params[:name]
    erb :birthday
  end
end
