require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  #Assists in the setup
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  #first thing we see- welcome

  get "/" do
    #redirect '/home' if authorized?
    erb :home
  end
  
  get '/images/show' do
    redirect '../images/show'
  end

  get '/termsandconditions.erb' do
    erb :'users/termsandconditions'
  end

  get '/users/show' do
    redirect '..users/show'
  end
  #need helper methods for controllers
  helpers do 
    
    def logged_in?
      !!current_user
    end
    
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    #checks if we're logged in or not
    # def logged_in?
    #   !!session[:user_id]
    # end
    #current user

    #now we need authentication, if not it goes back to log in
    def authenticate
      if !logged_in || current_user.nil?
        redirect '/login'
      end
    end
    #checks if logged in
    def authorized?
      !!logged_in? && !current_user.nil?
    end
    
  end

  not_found do
  erb :"error", layout: false
end

end
