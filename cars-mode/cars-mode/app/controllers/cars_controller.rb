class CarsController < ApplicationController

  #Index GET: /cars
  get "/cars" do
    @cars = Car.all
    erb :"/cars/index.html"
  end

  #New GET: /cars/new
  get "/cars/new" do
    @cars= Car.new
    erb :"/cars/new.html"
  end

  #Create POST: /cars
  post "/cars" do
    @car = Car.create(params)
    redirect "/cars/#{@car.id}"
  end

  #Show GET: /cars/5
  get "/cars/:id" do
    @car = Article.find(params[:id])
    erb :"/cars/show.html"
  end

  #Edit GET: /cars/5/edit
  get "/cars/:id/edit" do
    @car = Car.find(params[:id])
    erb :"/cars/edit.html"
  end

  #Update PATCH: /cars/5
  patch "/cars/:id" do
    @car = Car.find(params[:id])
    @car.update(params[:car])
    redirect "/cars/#{@car.id}"
  end

  #Destroy DELETE: /cars/5/delete
  delete "/cars/:id/delete" do
    Car.destroy(params[:id])
    redirect "/cars"
  end
end
