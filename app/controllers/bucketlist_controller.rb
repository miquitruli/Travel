class BucketlistsController < ApplicationController
    before '/bucketlists/*' do #makes sure bucketlist are not available until user is logged in
        authentication_required
    end

    get '/bucketlists' do
        @bucketlist = current_user.bucketlists
        erb :"bucketlists/index.html"
    end
    
    get '/bucketlists/new' do
        @continents = Continent.all

        erb :"bucketlists/new.html"
    end

    get '/bucketlists/:id' do
        @bucketlist = current_user.bucketlists.find(params[:id])

        erb :"bucketlists/show.html"
    end

    post '/bucketlists' do
        @bucketlist = Bucketlist.new
        @bucketlist.name = params[:name]
        @bucketlist.user = current_user

        if @bucketlist.save
            redirect '/bucketlists'
        else
            erb :"bucketlists/new.html"
        end
    end

    post '/bucketlists/:id/countries' do
        @bucketlist=current_user.bucketlists.find(params[:id])

        @countries = @bucketlist.countries.build(:visited=>params[:visited])
    end


    post '/bucketlists/new' do
        "Hello"
    end
end