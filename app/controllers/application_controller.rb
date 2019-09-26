
class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ATimeForFlowers"
    register Sinatra::Flash
  end
  
  get '/' do
    
    flash[:notice] = "Hooray, Flash is working!"
    puts "************************* FLASH"
    puts flash
    erb :index
    
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/signup?error=Username already taken"
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
