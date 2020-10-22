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
        else
          erb :'rocks/new'
        end
      end

      get "/rocks/:id" do
        not_logged_in_redirect
        set_rock

        if !@rock
          redirect "/geologists/welcome"
        end
        erb :'rocks/show'

      end

      get "/rocks/:id/edit" do
        not_logged_in_redirect
        set_rock
        authorized?(@rock)

        erb :'rocks/edit'
      end

      patch "/rocks/:id" do
        set_rock
        authorized?(@rock)

        @rock.update(params["rock"])
        redirect "rocks/#{@rock.id}"
      end

      delete "/rocks/:id" do
        set_rock
        authorized?(@rock)

        @rock.destroy
        redirect "geologists/home"
      end

      private
      def set_rock
        @rock = Rock.find_by_id(params[:id])
        if !@rock
          redirect "/geologists/home"
        end
      end

end