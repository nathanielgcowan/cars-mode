require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
  end

  helpers do

    def logged_in?
      !!current_driver
    end

    def current_driver
      @current_driver ||= Driver.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      driver = Driver.find_by(:email => email)
      if driver && driver.authenticate(password)
        session[:email] = driver.email
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

  end
end
