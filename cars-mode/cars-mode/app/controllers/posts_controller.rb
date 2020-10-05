class PostsController < ApplicationController

  # # GET: /posts
  # get "/posts" do
  #   "A list of publically available posts"
  #   # erb :"/posts/index.html"
  # end

  # # GET: /posts/new
  # get "/posts/new" do
  #   erb :"/posts/new.html"
  #   if !logged_in?
  #     redirect "/login"
  #   else
  #     "A new post form"
  #   end
  # end

  # # POST: /posts
  # post "/posts" do
  #   redirect "/posts"
  # end

  # # GET: /posts/5
  # get "/posts/:id" do
  #   erb :"/posts/show.html"
  # end

  # # GET: /posts/5/edit
  # get "/posts/:id/edit" do
  #   if !logged_in?
  #     redirect "/login"
  #   else
  #     #how do I find the post that only the autdriver is allowed to edit
  #    if current_driver
  #     post = CreatePost.find_by(params[:id])
  #     # if post.driver_id == current_driver.id
  #       "An edit a car from #{current_driver.id} is editing #{post.id}"
  #     else
  #       redirect '/posts'
  #     end
  #   end
  # end

  # # PATCH: /posts/5
  # patch "/posts/:id" do
  #   redirect "/posts/:id"
  # end

  # # DELETE: /posts/5/delete
  # delete "/posts/:id/delete" do
  #   redirect "/posts"
  # end
end
