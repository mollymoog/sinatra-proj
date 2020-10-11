require './config/environment'

class RockController < ApplicationController


      get "/rocks/new" do
        if !logged_in?
          redirect "/geologists/welcome"
        end
        erb :'rocks/new'
      end

      post "/rocks" do
        @rock = current_geologist.rocks.build(params["rock"])
        if @rock.save
          redirect '/geologists/home'
        end
      end

      get "/rocks/:id" do
        if !logged_in?
          redirect "/geologists/welcome"
        end
        @rock = Rock.find_by_id(params[:id])
        erb :'rocks/show'
      end

      get "/rocks/:id/edit" do
        if !logged_in?
          redirect "/geologists/welcome"
        end
        @rock = Rock.find_by_id(params[:id])
        erb :'rocks/edit'
      end

      patch "/rocks/:id" do
        @rock = Rock.find_by_id(params[:id])
        @rock.update(params["rock"])
        redirect "rocks/#{@rock.id}"
      end

      delete "/rocks/:id" do
        @rock = Rock.find_by_id(params[:id])
        @rock.destroy
        redirect "geologists/home"
      end

end