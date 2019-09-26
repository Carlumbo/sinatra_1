class FlowersController < ApplicationController

  get '/flowers' do
    redirect_if_not_logged_in
    @flowers = Flower.all
    erb :'flowers/index'
  end


  get '/flowers/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'flowers/new'
  end

  get '/flowers/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @flower = Flower.find(params[:id])
    erb :'flowers/edit'
  end

  post '/flowers/:id' do
    redirect_if_not_logged_in
    @flower = Flower.find(params[:id])
    unless Flower.valid_params?(params)
      redirect '/flowers/#{@flower.id}/edit?error=Invalid flower'
    end
    @flower.update(params.select{|s| s =="name" || s="species" || s == 'flower_garden_id'})
    redirect '/flowers/#{flower.id}'
  end

  get '/flowers/:id' do
    redirect_if_not_logged_in
    @flower = Flower.find(params[:id])
    erb :'flowers/show'
  end

  post '/flowers' do
    redirect_if_not_logged_in
    unless Flower.valid_params?(params)
      redirect '/flowers/new?error=invalid flowers'
    end
    Flower.create(params)
    redirect '/flowers'
  end

  get '/flowers/:id/delete' do
    redirect_if_not_logged_in
    @flower = Flower.find(params[:id])
    @flower.delete 
    redirect '/flowers'
  end
end


