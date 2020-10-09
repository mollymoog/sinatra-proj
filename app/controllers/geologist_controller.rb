require './config/environment'

class GeologistController < ApplicationController

    get "/geologists/signup" do 
        erb :'/geologists/signup'
    end

    post "/geologists" do
        if params[:username] == "" || params[:password] == ""
            redirect "/geologists/signup"
        else 
            Geologist.create(username: params[:username], password: params[:password])
            redirect '/geologists/login'
        end
        redirect 'geologists/welcome'
    end

    get "/geologists/login" do
        erb :'geologists/login'
    end

    post "/geologists/login" do
        @geologist = Geologist.find_by(:username => params[:username])

        if @geologist && @geologist.authenticate(params[:password])
            session[:user_id] = @geologist.id
            redirect to '/geologists/home'
        else
            redirect '/geologists/welcome'
        end
    end

    get "/geologists/home" do
        if !logged_in?
            redirect "/geologists/welcome"
        else
            @geologist = Geologist.find(session[:user_id])
            @rocks = current_geologist.rocks

            erb :'geologists/home'
        end
    end

    get "/geologists/welcome" do
        erb :'geologists/failure'
    end

    get "/geologists/logout" do
        session.clear
        redirect "/geologists/welcome"
    end

end