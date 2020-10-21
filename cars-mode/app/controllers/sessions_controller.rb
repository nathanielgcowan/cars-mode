class SessionsController < ApplicationController

  # GET: /login
  get "/login" do
    erb :"/sessions/login.html"
  end

  # POST: /sessions
  post "/sessions" do
    login(params[:email], params[:password])
    redirect '/create_posts'
  end

  get '/logout' do
    logout!
    redirect '/create_posts'
  end
end
