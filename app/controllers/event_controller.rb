class EventController < ApplicationController

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

  get '/events/:slug' do

    erb :"events/show"
  end

end
