class FlowerGardenController < ApplicationController


  get '/gardens' do
    redirect_if_not_logged_in
    @gardens = FlowerGarden.all
    erb :'flower_gardens/index'
  end


  get '/gardens/new' do
    redirect_if_not_logged_in
    erb :'flower_gardens/new'
  end

  get '/gardens/:id/edit' do
    record_not_found
  @garden = FlowerGarden.find(params[:id])
   if current_user.id == @garden.gardener_id
    erb :'flower_gardens/edit'
   else 
    flash[:message] = "That garden doesnt belong to you\n"
    redirect "/gardens"
   end 
  end


  patch '/gardens/:id' do
    redirect_if_not_logged_in
    record_not_found
    @garden = FlowerGarden.find(params[:id])
    valid_user?
    unless FlowerGarden.valid_params?(params)
      flash[:message] = "invalid garden selection"
      redirect "/gardens/#{@garden.id}/edit"
    end
    @garden.update(params.select{|c|c =="name"|| c =="size"})
    redirect "/gardens"
  end


  get "/gardens/show" do
    redirect_if_not_logged_in
    @gardens = FlowerGarden.all
    erb :'flower_gardens/show'
  end

  get "/gardens/:id" do
    record_not_found
    redirect_if_not_logged_in
    @garden = FlowerGarden.find(params[:id])
    @gardeners = Gardener.all
    erb :'flower_gardens/show'
  end


  post "/gardens" do
    redirect_if_not_logged_in

    unless FlowerGarden.valid_params?(params)
      flash[:message] = "invalid garden selection"
      redirect "/gardens/new"
    end
    @gardens = FlowerGarden.create(params)
    @gardens.gardener_id = current_user.id
    @gardens.save
    redirect "/gardens"
  end


  delete '/gardens/:id/delete' do
    redirect_if_not_logged_in
    record_not_found
    @garden = FlowerGarden.find(params[:id])
    valid_user?
    if current_user.id == @garden.gardener_id
    @garden = FlowerGarden.find(params[:id])
    @garden.delete 
    flash[:message] = "Garden Deconstructed!"
    redirect '/gardens'
    else 
      flash[:message] = "Hey that's not yours to destroy!\n"
     redirect '/gardens'
    end 
  end

end