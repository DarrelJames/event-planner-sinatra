class EventController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    erb :"events/index"
  end

  get '/events/new' do
    redirect_if_not_logged_in
    erb :"events/new"
  end

  post '/events' do
    event = current_user.events.build(params[:event])
    event.build_venue(params[:venue])
    if event.save
      redirect to("/events/#{event.slug}/manage")
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
    if event.update(params[:event])
      redirect to("/events/#{event.slug}/edit")
    else
      redirect to("/events/#{event.slug}/edit")
    end
  end

  delete '/events/:slug' do
    event = Event.find_by_slug(params[:slug])
    event.destroy
    redirect to("/users")
  end

  get '/events/:slug/edit' do
    redirect_if_not_logged_in
    @event = Event.find_by_slug(params[:slug])

    erb :"events/edit", :layout => :manage
  end


end
