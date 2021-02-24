class UserController < ApplicationController
  #need a user home page, redirect to login if user is not logged in
  get '/home' do
    authenticate
    @user = current_user
    @current
  end

end