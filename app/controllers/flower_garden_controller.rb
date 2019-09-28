class FlowerGardenController < ApplicationController


  get '/gardens' do
    redirect_if_not_logged_in
    @gardens = FlowerGarden.all
    @gardens.last.gardener_id = current_user.id
    erb :'flower_gardens/index'
  end

  get '/gardens/new' do
    redirect_if_not_logged_in
    erb :'flower_gardens/new'
  end

  post '/gardens/:id/edit' do
  @garden = FlowerGarden.find(params[:id])
  binding.pry
   if current_user == @garden.gardener_id
    erb :'flower_gardens/edit'
   else 
    flash[:message] = "That Garden doesnt belong to you"
    redirect "/gardens"
   end 
  end



  post '/gardens/:id' do
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    unless FlowerGarden.valid_params?(params)
      flash[:message] = "invalid garden selection"
      redirect "/gardens/#{@garden.id}/edit"
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
      flash[:message] = "invalid garden selection"
      redirect "/gardens/new"
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