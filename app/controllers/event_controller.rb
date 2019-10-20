class EventController < ApplicationController

  get '/events' do
    erb :"events/index"
  end

  get '/events/new' do
    redirect_if_not_logged_in
    erb :"events/new"
  end

  post '/events' do
    event = current_user.events.build(params)

    if event.save
      redirect to("/events/#{event.name}")
    else
      redirect to('/events/new')
    end
  end

  get '/events/:slug/manage' do
    @event = Event.find_by_slug(params[:slug])
    erb :"events/pages"
  end

  get '/events/:slug' do
    @event = Event.find_by_slug(params[:slug])

    erb :"events/show"
  end

  patch '/events/:slug' do
    event = Event.find_by_slug(params[:slug])
    event.update(params[:event])
    redirect to("/events/#{event.slug}/edit")
  end

  get '/events/:slug/edit' do
    @event = Event.find_by_slug(params[:slug])

    erb :"events/edit", :layout => :manage
  end


end
