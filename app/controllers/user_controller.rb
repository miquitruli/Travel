class UsersController < ApplicationController
    get '/register' do
        erb :'users/new.html'
    end

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]

        if @user.save
            redirect "/login"
        else
            erb :'users/new.html'
        end
    end

    get '/login' do
        erb :'users/login.html'
    end

    post '/login' do #authenticate email and password. If UN and PW are valid it takes them to home page. If false, asks user to login again.
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session["user_id"] = @user.id
            redirect "/"
        else
            erb :'users/login.html'
        end 
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end