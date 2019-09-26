class GardenerController < ApplicationController

  get '/gardeners/:id' do
    if !logged_in
      redirect '/gardens'
    end

    @gardener = Gardener.find(params[:id])
    if !@gardener.nil? && @gardener == current_gardener
      erb :'gardener/show'
    else
      redirect '/gardens'
    end
  end


  get '/signup' do
    @error_message = params[:error]
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
      redirect '/gardens'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'gardeners/login'
    else
      redirect '/gardens'
    end
  end

  post '/login' do
    gardener = Gardener.find_by(:username => params[:username])
    if gardener && gardener.authenticate(params[:password])
      session[:user_id] = gardener.id
      redirect '/gardens'
    else
      redirect to "/login?error=The Username or Password was incorrect, please retry or Signup in the top left!"
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