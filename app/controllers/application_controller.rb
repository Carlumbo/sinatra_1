
class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ATimeForFlowers"
    register Sinatra::Flash
  end
  
  get '/' do
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message]= "Usermname Already Taken"
        redirect "/signup"
      end
    end

    def valid_user?
      if current_user.id != @garden.gardener_id
        flash[:message]=  "You can not edit this garden!"
        redirect '/gardens'
      else
      end     
    end  

    def logged_in?
      !!session[:user_id]
    end

    def current_user
     current_user = Gardener.find(session[:user_id])
    end

  end

end
