require './config/environment'

class RockController < ApplicationController


      get "/rocks/new" do
        erb :'rocks/new'
      end

      post "/rocks" do
        binding.pry
        @rock = current_geologist.rocks.build(params)
        if @rock.save
          redirect '/geologists/home'
        end
      end

      get "/rocks/:id" do
        @rock = Rock.find_by(params[:id])
        erb :'rocks/show'
      end

end