class WebsiteController < ApplicationController
  get '/events/:slug' do
    @event = Event.find_by_slug(params[:slug])

    erb :"events/show", :layout => :website
  end

  get '/events/:slug/venue' do
    @event = Event.find_by_slug(params[:slug])
    erb :"venues/show", :layout => :website
  end
end
