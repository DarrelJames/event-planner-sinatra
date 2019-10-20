class UserController < ApplicationController


  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    user = User.new(params)

    if user.save
      session[:user_id] = user.id
      redirect to('/users')
    else
      redirect to('/signup')
    end
  end

  get '/users' do
    redirect_if_not_logged_in
    erb :"/users/index"
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      redirect to('/users')
    else
      redirect to('/login')
    end
  end

  post '/logout' do
    session.destroy
    redirect to('/')
  end
end
