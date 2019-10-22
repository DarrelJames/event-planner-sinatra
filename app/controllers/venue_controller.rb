class VenueController < ApplicationController

  get '/venues/new' do
    redirect_if_not_logged_in
    erb :"venues/new"
  end

  get '/venues/:id/edit' do
    redirect_if_not_logged_in
    @venue = Venue.find_by(id: params[:id])
    erb :"venues/edit"
  end

  get '/venues' do
    redirect_if_not_logged_in
    erb :"venues/index"
  end

  post '/venues' do
    venue = current_user.venues.build(params[:venue])
    if venue.save
      redirect to("/venues")
    end
  end

  get '/venues/:id' do
    redirect_if_not_logged_in
    @venue = Venue.find_by(id: params[:id])
    erb :"venues/show"
  end

  delete '/venues/:id' do
    venue = Venue.find_by(id: params[:id])
    venue.destroy
    redirect to("/venues")
  end
end
