class ImagesController < ApplicationController
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
        # puts "IMAGE #{@image.inspect}"
        erb :"images/show"
      end
    
      get '/images/:id/edit' do
        @image = Image.find(params[:id])
        erb :"images/edit"
      end

      post '/images' do
        puts "===================================="
        # puts params.inspect
        puts "===================================="
        @filename = params[:file][:filename]
        file = params[:file][:tempfile]
        @image= Image.create!(url:@filename)
        current_user.images << @image

        File.open("./public/#{@image.url}", 'wb') do |f|
          f.write(file.read)
        end
        
        redirect to "/images/#{@image.id}"
      end
      
    
      post '/images/:id' do
        @image = Image.find(params[:id])
        @image.name = params['image']['name']
        @image.year_completed = params['image']['year_completed']
        @image.save
        redirect to "/images/#{@image.id}"
      end
    
      # post '/images' do
      #  # Image.create(name: params['image']['name'], year_completed: params['image']['year_completed'])
      #   redirect '/images'
      # end
# 
# 
#       
# 
# 
# 
#       
# post "/images" do
#   puts "CREATING IMAGE"
#   #Create new Image Model
#   puts "IMAGE PARAMS #{params.inspect}"
#   img = Image.new

#   #Save the data from the request
#   img.file    = params[:file] #carrierwave will upload the file automatically
#   img.caption = "This is the caption" #Or recieve it from params

#   #Save
#   img.save!
#   puts "IMAGE ATTRIBUTE:#{img.image}"

#   puts "-------------ALL IMAGES-----------"
#   puts Image.all.inspect
#   puts "-----------------------------------"
#   #Redirect to view
#   # render "/images/#{img.id}"
#   @image=img
#   erb :"images/show"
# end





# get "/image/index" do
#   erb :'/image/index'
# end

# post '/save_image' do

#   @filename = params[:file][:filename]
#   file = params[:file][:tempfile]

#   File.open("./public/#{@filename}", 'wb') do |f|
#     f.write(file.read)
#   end

#     erb :show
#   end

end