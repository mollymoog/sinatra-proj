require './config/environment'

class GeologistController < Sinatra::Base
    
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
      end

#CREATE
    get "/geologists/new" do
        erb :'/geologists/new'
    end

    post "/geologists" do

        erb :"/geologists/index"
    end

#READ
    get "/geologists/:id" do
    end

    get "/geologists" do
    end

#UPDATE 
    get "/geologists/:id/edit" do
    end

    patch "/geologists/:id" do
    end

#DELETE
    post "/geologists/:id" do
    end


end