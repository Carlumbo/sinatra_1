class GardenerController < ApplicationController

  get '/gardeners/id' do
    if !logged_in
      redirect '/gardens'
    end

    @gardener = Gardener.find(params[:id])
    if !@gardner.nil? && @gardener == current_gardener
      erb :'gardner/show'
    else
      redirect '/gardens'
    end
  end


  get '/signup' do
    if !session[:user_id]
      erb :'gardner/new'
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
    if gardener && gardner.authenticate(params[:password])
      session[:user_id] = gardener
      redirect '/gardens'
    else
      redirect to '/signup'
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
