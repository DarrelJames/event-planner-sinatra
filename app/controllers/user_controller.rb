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

    erb :"/users/index"
  end
end
