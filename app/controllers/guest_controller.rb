class GuestController < ApplicationController

  get '/guests/new' do
    redirect_if_not_logged_in
    erb :"guests/new", :layout => :manage
  end

  get '/guests/:id/edit' do
    redirect_if_not_logged_in
    @guest = Guest.find_by(id: params[:id])
    if @guest.user == current_user
      erb :"guests/edit", :layout => :manage
    else
      flash[:message] = "Sorry you don't have access to that page"
      redirect to("/users")
    end
  end

  get '/guests' do
    redirect_if_not_logged_in
    erb :"guests/index", :layout => :manage
  end

  post '/guests' do
    guest = current_user.guests.build(params[:guest])
    if guest.save
      redirect to("/guests")
    end
  end

  get '/guests/:id' do
    redirect_if_not_logged_in
    @guest = Guest.find_by(id: params[:id])
    erb :"guests/show", :layout => :manage
  end

  patch '/guests/:id' do
    guest = Guest.find_by(id: params[:id])

    if guest.update(params[:guest])
      redirect to("/guests/#{guest.id}")
    else
      #flash message unable to edit
      redirect to("/guests/#{guest.id}/edit")
    end
  end

  delete '/guests/:id' do
    guest = Guest.find_by(id: params[:id])
    if guest.user == current_user
      guest.destroy
      redirect to("/guests")
    else
      flash[:message] = "Sorry you don't have access to that page"
      redirect to("/users")
    end
  end
end
