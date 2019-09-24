#require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ATimeForFlowers"
  end

  get '/' do
    erb :index
    #welcome to fwitter!!!
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You are not logged in, so you can't do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Gardener.find(session[:user_id])
    end

  end

end
