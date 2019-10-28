class EventController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    erb :"events/index", :layout => :manage
  end

  get '/events/new' do
    redirect_if_not_logged_in
    erb :"events/new"
  end

  post '/events' do
    event = current_user.events.build(params[:event])
    event.venue = Venue.find_or_create_by(params[:venue])


    if event.venue.valid? && event.save
      redirect to("/events/#{event.slug}/manage")
    else
      flash[:message] = event.errors.full_messages.to_sentence + event.venue.errors.full_messages.to_sentence
      redirect to('/events/new')
    end
  end

  get '/events/:slug/manage' do
    redirect_if_not_logged_in
    @event = Event.find_by_slug(params[:slug])

    erb :"events/manage"
  end

  # get '/events/:slug' do
  #   @event = Event.find_by_slug(params[:slug])
  #
  #   erb :"events/show"
  # end

  patch '/events/:slug' do
    event = Event.find_by_slug(params[:slug])

    if event.user == current_user && event.update(params[:event])

      redirect to("/events/#{event.slug}/edit")
    else
      flash[:message] = event.errors.full_messages.to_sentence
      redirect to("/events/#{event.slug}/edit")
    end

  end

  delete '/events/:slug' do
    event = Event.find_by_slug(params[:slug])

    if event.user == current_user
      event.destroy
      flash[:message] = "Successfully Deleted Event"
      redirect to("/users")
    else
      flash[:message] = "Sorry you don't have access to that page"
      redirect to("/users")
    end
  end

  get '/events/:slug/edit' do
    redirect_if_not_logged_in

    @event = Event.find_by_slug(params[:slug])

    redirect_if_not_authorized(@event)

    erb :"events/edit"
  end


end
