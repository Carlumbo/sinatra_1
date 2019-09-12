require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set  :session_secret, "batman"
  end

  get '/' do
    redirect to '/login'
  end

  get '/login' do
     erb :index
  end

  post '/hello' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect to '/posts'
  end

  post '/thanks' do
    "Thank you for at least trying to save the world!"
  end
end
