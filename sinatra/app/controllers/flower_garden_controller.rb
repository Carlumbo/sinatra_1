class FlowerGardenController < ApplicationController


  get '/gardens' do
    redirect_if_not_logged_in
    @gardens = FlowerGarden.all
    erb :'flower_gardens/index'
  end

  get '/gardens/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'flower_gardens/new'
  end

  get '/gardens/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @garden = FlowerGarden.find(params[:id])
    erb :'flower_gardens/edit'
  end

  post '/gardens/:id' do
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    unless FlowerGarden.valid_params?(params)
      redirect "/gardens/#{@garden.id}/edit?errror=invalie garden election"
    end
    @garden.update(params.select{|c|c=="name"|| c ="size"})
    redirect "/garden/#{@garden.id}"
  end

  get "/garden/:id" do
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    erb :'flower_gardens/show'
  end

  post "/gardens" do
    redirect_if_not_logged_in

    unless FlowerGarden.valid_params?(params)
      redirect "/bags/new?error=invalid garden selection"
    end
    FlowerGarden.create(params)
    redirect "/gardens"
  end

end
