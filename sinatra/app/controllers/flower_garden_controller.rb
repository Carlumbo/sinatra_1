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
      redirect "/gardens/#{@garden.id}/edit?errror=invalie garden selection"
    end
    @garden.update(params.select{|c|c=="name"|| c ="size"})
    redirect "/gardens/#{@garden.id}"
  end

  get "/gardens/:id" do
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    erb :'flower_gardens/show'
  end

  post "/gardens" do
    redirect_if_not_logged_in

    unless FlowerGarden.valid_params?(params)
      redirect "/gardens/new?error=invalid garden selection"
    end
    FlowerGarden.create(params)
    redirect "/gardens"
  end

  get '/gardens/:id/delete' do
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    @garden.delete 
    redirect '/gardens'
  end

end
