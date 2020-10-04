class SessionsController < ApplicationController

  # GET: /login
  get "/login" do
    erb :"/sessions/login.html"
  end

  # POST: /sessions
  post "/sessions" do
    login(params[:email], params[:password])
    redirect '/posts'
  end

  get '/logout' do
    logout!
    redirect '/posts'
  end
end
