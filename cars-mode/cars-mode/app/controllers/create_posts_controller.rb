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
    if !logged_in?
      redirect "/login"
    else
      @car = CreatePost.new
      erb :"/create_posts/new.html"
    end
  end

  # create
  post "/create_posts" do
      @car = CreatePost.create(params)
      redirect "/create_posts"#{@car.id}"
  end

  # show
  get "/create_posts/:id" do
    @car = CreatePost.find(params[:id])
    erb :"/create_posts/show.html"
  end

  # edit
  get "/create_posts/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      @car = CreatePost.find(params[:id])
      erb :"/create_posts/edit.html"
    end
  end

  # update
  patch "/create_posts/:id" do
    @car = CreatePost.find(params[:id])
    @car.update(params[:create_posts])
    redirect to "/create_posts/#{@car.id}"
  end

  # destroy
  delete "/create_posts/:id" do
    CreatePost.destroy(params[:id])
    redirect to "/create_post"
  end
end
