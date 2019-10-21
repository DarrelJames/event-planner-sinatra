class GuestController < ApplicationController

  get '/guests/new' do
    erb :"guests/new"
  end

  get '/guests' do
    erb :index
  end

  post '/guests' do
    guest = current_user.guests.build(params[:guest])
    if guest.save
      redirect to("/guests")
    end
  end
end
