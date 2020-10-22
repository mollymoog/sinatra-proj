require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "moose_hunter"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_geologist
      Geologist.find(session[:user_id])
    end

    def not_logged_in_redirect
      if !logged_in?
        redirect "/geologists/welcome"
      end
    end

    def authorized? (record)
      if record.geologist_id != current_geologist.id
        redirect "/geologists/home"
      end
    end

  end

  get "/" do
    erb :welcome
  end

end
