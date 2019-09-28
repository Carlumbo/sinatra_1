class GardenerController < ApplicationController

  get '/gardeners/:id' do
    if !logged_in?
      redirect '/gardens'
    end

    @gardener = Gardener.find(params[:id])
    if !@gardener.nil? && @gardener == current_use
      erb :'gardener/show'
    else
      redirect '/gardens'
    end
  end


  get '/signup' do
    if !session[:user_id]
      erb :'gardeners/new'
    else
      redirect to '/flowers'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      
      redirect to '/signup'
    else
      @gardener = Gardener.create(username: params[:username], password: params[:password])
      session[:user_id] = @gardener.id
      flash[:message] = "Thanks for making an account!"
      redirect '/gardens'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'gardeners/login'
    else
      redirect '/gardens'
    end
  end

  post '/login' do
    gardener = Gardener.find_by(:username => params[:username])
    if gardener && gardener.authenticate(params[:password])
      flash[:message] = "Login Successful!"
      session[:user_id] = gardener.id
      redirect '/gardens'
    else
      flash[:message] = "The Username or Password was incorrect, please retry or Signup in the top left!"
      redirect to "/login"
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to 'login'
    else
      redirect to '/'
    end
  end

end
