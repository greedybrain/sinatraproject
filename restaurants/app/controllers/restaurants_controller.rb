class RestaurantsController < ApplicationController 
  
  # CREATE
    # New 
    # make a get request to "/restaurants/new"
    get '/restaurants/new' do
      erb :'/restaurants/new'
    end 
    
    # Create
     # make a post request to "/restaurants"
     
    post '/restaurants' do
      restaurant = Restaurant.new(params)
      if !restaurant.name.empty? && !restaurant.location.empty? && !restaurant.cuisine.empty? 
        restaurant.save 
        redirect '/restaurants'
      else
        @error = "Data invalid. Please try again"
        erb :'/restaurants/new'
      end 
    end 
    
     
  # READ
    # Index
    # make a get request to "/restaurants"
    
    get '/restaurants' do 
      @restaurants = Restaurant.all.reverse
      erb :'restaurants/index'
    end 
  
    # Show
    # make a get request to "/restaurants/:id"
  
  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params["id"])
    erb :'restaurants/show'
  end 
  
  # UPDATE
    # Edit 
    # Make a get request to "/restaurants/:id/edit"
    get '/restaurants/:id/edit' do
      @restaurant = Restaurant.find(params[:id])
      erb :'/restaurants/edit'
    end 
    
    # Update 
    # Make a patch request to "/restaurants/:id"
   patch '/restaurants/:id' do
     restaurant = Restaurant.find(params[:id])
     if !params["restaurant"]["name"].empty? && !params["restaurant"]["location"].empty? && !params["restaurant"]["cuisine"].empty? 
     restaurant.update(params["restaurant"])
      else
        @error = "Data invalid. Please try again"
        erb :'/restaurants/edit'
      end 

   end 
  # DESTROY
  # make a delete request to "/restaurants/:id"
end 
