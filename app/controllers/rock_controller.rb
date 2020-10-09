require './config/environment'

class RockController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
      end

end