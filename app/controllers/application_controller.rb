require './config/environment'

class ApplicationController < Sinatra::Base

  #Assists in the setup
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, SESSION_SECRET
  end

  #first thing we see- welcome

  get "/" do
    redirect '/home' if authorized?
    erb :welcome
  end
  #need helper methods for controllers
  helpers do 

    #checks if we're logged in or not
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

end
