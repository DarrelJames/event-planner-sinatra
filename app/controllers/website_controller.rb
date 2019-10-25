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
    erb :"/guests/rsvp", :layout => :website
  end

  post '/events/:slug/rsvp/guest' do
    event = Event.find_by_slug(params[:slug])
    guest = event.guests.find_by(name: params)
    if guest
      session[:guest_id] = guest.id
      redirect to("/events/#{event.slug}/rsvp")
    else
      flash[:message] = "Sorry, you're name is not on the guestlist. Please try again or Contact the host."
      redirect to("/events/#{event.slug}/rsvp")
    end

  end

  post '/events/:slug/rsvp' do
    event = Event.find_by_slug(params[:slug])
    guest = Guest.find_by(name: session[:guest_id])
    rsvp = Rsvp.new
  end
end
