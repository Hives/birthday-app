require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    erb :index
  end
end
