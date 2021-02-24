class SessionsController < ApplicationController
 
 #sign up

  get'/signup' do
    redirect '/home' if authorized?
    erb :"/users/register"
  end

  #login, if logged in already, sends user back to home
  
  get '/login' do
    redirect '/home' if authorized?
    @failed = false
    erb:'/users/login'
  end

  #post request for log in form

  post '/login' do
    user = User.find_by(username : params[:username])
    if !!user && user.authenticate(params[:password])
      session[:user_id = user.id]
      redirect "/home"
    else
      @failed = true
      erb:'/users/login'
    end
  end
  #post sign up
  post '/signup' do
    redirect 'home' if authorized?
    @user = User.new(params[:user])
    if @user.save
      session[:usr_id] = @user.id
      redirect '/home'
    else
      erb : '/users/signup'
    end
  end
#Delete part in CRUD
  delete 'logout' do
    sessions.clear if logged_in?
    redirect '/'
  end



end

