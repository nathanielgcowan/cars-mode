class CreatePostsController < ApplicationController
  # @car = CreatePost.new
  # @car.model =params[:model]
  # @car.year = params[:year]
  # @car.driver_id = params[:driver_id]

  get '/' do
    redirect "/create_posts"
  end

  # GET: /index
  get "/create_posts" do
    # "A list of publically available posts"
    @cars = CreatePost.all
    erb :"/create_posts/index.html"
  end

  # new
  get "/create_posts/new" do
      erb :"/create_posts/new.html"
  end

  post "/create_posts" do
      @car = CreatePost.create(:model => params[:model], :year => params[:year], :driver_id => current_driver.id)

      redirect "/create_posts/#{@car.id}"
  end

  # show
  get "/create_posts/:id" do
    #if are current_driver id is the one making the car than proceed
    if current_driver
      @car = CreatePost.find_by_id(params[:id])
      erb :"/create_posts/show.html"
    end
  end


  # edit load edit form
  get "/create_posts/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      @car = CreatePost.find(params[:id])
      # binding.pry
      if current_driver.id == @car.driver_id
        erb :"/create_posts/edit.html"
      else
        redirect "/create_posts"
      end
    end
  end

  # this is the helper method being used. remember this for later
  # def current_driver
  #   @current_driver ||= Driver.find_by(:email => session[:email]) if session[:email]
  # end

  patch "/create_posts/:id" do #edit action
    @car = CreatePost.find_by_id(params[:id])
    @car.model = params[:model]
    @car.year = params[:year]
    @car.driver_id = params[:driver_id]
    @car.save
    if current_driver.id == @car.driver_id
      @car.save #save ithe code before you redirect
      redirect to "/create_posts/#{@car.id}"
    else
      redirect "/create_posts"
    end
  end

  # destroy
  delete "/create_posts/:id" do #delete action
    if !logged_in?
      redirect "/login"
    else
      @car = CreatePost.find_by_id(params[:id])
      @car.model = params[:model]
      @car.year = params[:year]
      @car.id = params[:id]
      @car.delete
      redirect to "/create_posts"
    end
  end
end
