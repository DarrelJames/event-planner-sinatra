class GuestController < ApplicationController

  get '/guests/new' do
    redirect_if_not_logged_in
    erb :"guests/new"
  end

  get '/guests/edit' do
    redirect_if_not_logged_in

    erb :"guests/edit"
  end

  get '/guests' do
    redirect_if_not_logged_in
    erb :"guests/index"
  end

  post '/guests' do
    guest = current_user.guests.build(params[:guest])
    if guest.save
      redirect to("/guests")
    end
  end

  get '/guests/:slug' do
    redirect_if_not_logged_in
    @guest = Guest.find_by_slug(params[:slug])
    erb :"guests/show"
  end
end
