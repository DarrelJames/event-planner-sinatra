class WebsiteController < ApplicationController
  get '/events/:slug' do
    @event = Event.find_by_slug(params[:slug])

    erb :"events/show", :layout => :website
  end

  get '/events/:slug/venue' do
    @event = Event.find_by_slug(params[:slug])
    erb :"venues/show", :layout => :website
  end

  get '/events/:slug/rsvp' do
    @event = Event.find_by_slug(params[:slug])
    # @guest = current_user.guests.find_by(name: session[:guest_name])
    erb :"/guests/rsvp"
  end
end
