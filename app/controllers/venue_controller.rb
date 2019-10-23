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
    @venue = Venue.find_by(id: params[:id])
    if @venue.event.user == current_user
      erb :"venues/show"
    else
      flash[:message] = "Sorry you don't have access to that page"
      redirect to("/users")
    end
  end

  patch '/venues/:id' do
    venue = Venue.find_by(id: params[:id])
    if venue.update(params[:venue])
      redirect to("/venues/#{venue.id}/edit")
    else
      #flash message Edit Uncessessful
      redirect to("/venues/#{venue.id}/edit")
    end
  end


  delete '/venues/:id' do
    venue = Venue.find_by(id: params[:id])
    if venue.event.user == current_user
      venue.destroy
      redirect to("/venues")
    else
      flash[:message] = "Sorry you don't have access to that page"
      redirect to("/users")
    end
  end
end
