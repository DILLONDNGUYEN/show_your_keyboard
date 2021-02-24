 class SessionsController < ApplicationController
 
 get '/sessions/login' do 
      if logged_in?
        user_id = session[:user_id]
        # puts @user.id.inspect
        redirect to "users/#{user_id}"
      else
        erb:"sessions/login"
      end
    end

   
    #log in/authenticate
   
    post '/login' do
      # puts params.inspect
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "users/#{user.id}"
      else
        redirect to '/users/new'
      end
    end
  
    get '/sessions/logout' do
      if logged_in?
        session.destroy
        redirect to '/'
      else
        redirect to '/'
      end
    end
    
end