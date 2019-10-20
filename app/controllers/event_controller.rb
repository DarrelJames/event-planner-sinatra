class EventController < ApplicationController

  get '/events/new' do
    redirect_if_not_logged_in
    erb :"events/new"
  end

end
