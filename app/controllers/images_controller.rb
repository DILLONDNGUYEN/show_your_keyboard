require 'carrierwave/orm/activerecord'

class ImagesController < ApplicationController
    
  #create
      get '/images' do
        @images = Image.all
        @users = User.all
        erb :'images/index'
      end
    
      get '/images/new' do
        erb :"images/new"
      end
    
      get '/images/:id' do
        @image = Image.find(params[:id])
        erb :"images/show"
      end
    
      get '/images/:id/edit' do
        @image = Image.find(params[:id])
        if @image.user == current_user
          erb :"images/edit"
        else 
          redirect to "/images/#{@image.id}"
        end  
      end

      post '/images' do
        # puts "===================================="
        # puts "===================================="
        @filename = params[:file][:filename]
        file = params[:file][:tempfile]
        @image= Image.create(url:@filename)
        if @image.valid? 
          current_user.images << @image

          File.open("./public/images/#{@image.url}", 'wb') do |f|
            f.write(file.read)
          end
          
          redirect to "/images/#{@image.id}"
        else
          flash[:error] = @image.errors.full_messages.to_sentence
          redirect to "/images/new"
        end
      end  
      
    
      post '/images/:id' do
        @image = Image.find(params[:id])
        @image.name = params['image']['name']
        @image.year_completed = params['image']['year_completed']
        @image.save
        redirect to "/images/#{@image.id}"
      end

end