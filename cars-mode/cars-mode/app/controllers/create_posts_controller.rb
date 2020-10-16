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
      @car = CreatePost.create(:model => params[:model], :year => params[:year])
      redirect "/create_posts/#{@car.id}"
  end

  # show
  get "/create_posts/:id" do
    @car = CreatePost.find_by_id(params[:id])
    erb :"/create_posts/show.html"
  end

  # edit load edit form
  get "/create_posts/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      @car = CreatePost.find(params[:id])
      @driver = Driver.find(:email => email)
        if driver && driver.authenticate(password)
          erb :"/create_posts/edit.html"
        end
    end
  end

  # #authenicate the user_id
  # #if the right user id -> edit
  # #not the right id -> do not edit
  # #1)authenticate who can edit from

  # def login(email, password)
  #   driver = Driver.find_by(:email => email)
  #   if driver && driver.authenticate(password)
  #     session[:email] = driver.email
  #   else
  #     redirect '/login'
  #   end
  # end


  patch "/create_posts/:id" do #edit action
    @car = CreatePost.find_by_id(params[:id])
    @car.model = params[:model]
    @car.year = params[:year]
    @car.save
    redirect to "/create_posts/#{@car.id}"
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
