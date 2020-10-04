class CreatePostsController < ApplicationController

  # GET: /create_posts
  get "/create_posts" do
    erb :"/create_posts/index.html"
  end

  # GET: /create_posts/new
  get "/create_posts/new" do
    erb :"/create_posts/new.html"
  end

  # POST: /create_posts
  post "/create_posts" do
    redirect "/create_posts"
  end

  # GET: /create_posts/5
  get "/create_posts/:id" do
    erb :"/create_posts/show.html"
  end

  # GET: /create_posts/5/edit
  get "/create_posts/:id/edit" do
    erb :"/create_posts/edit.html"
  end

  # PATCH: /create_posts/5
  patch "/create_posts/:id" do
    redirect "/create_posts/:id"
  end

  # DELETE: /create_posts/5/delete
  delete "/create_posts/:id/delete" do
    redirect "/create_posts"
  end
end
