require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "eventplannersintra"
    register Sinatra::Flash

  end

  get "/" do
    if logged_in?
      redirect to('/users')
    else
      erb :index
    end
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect to('/login')
      end
    end

    def redirect_if_not_authorized(object)
      if current_user != object.user
        flash[:message] = "Sorry you don't have access to that page"
        redirect to('/users')
      end
    end

  end
end
