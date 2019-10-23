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
      flash[:message] = user.errors.full_messages.to_sentence
      redirect to('/signup')
    end
  end

  get '/users' do
    redirect_if_not_logged_in
    erb :"/users/index", :layout => :manage
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to('/users')
    else      
      flash[:message] = "Invalid email or Password. Please Try Again"
      redirect to('/login')
    end
  end

  get '/logout' do
    session.destroy
    flash[:message] = "Successfully logged out"
    redirect to('/')
  end
end
