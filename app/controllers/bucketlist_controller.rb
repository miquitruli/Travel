require 'rack-flash'

class BucketlistsController < ApplicationController
    before '/bucketlists/*' do #makes sure bucketlist are not available until user is logged in
        authentication_required
    end

    get '/bucketlists' do #lists of all of current users bucketlists on index.html
        @bucketlist = current_user.bucketlists
        erb :"bucketlists/index.html"
    end
    
    get '/bucketlists/new' do #where we create a bucketlist
        @continents = Continent.all
        
        erb :"bucketlists/new.html"
    end

    get '/bucketlists/countries_visited' do
        bucketlists = current_user.bucketlists
        @bucketlist_countries = BucketlistCountry.where(visited: true, bucketlist: bucketlists)

        erb :"bucketlists/countries_visited.html"
    end

    get '/bucketlists/:id' do 
        @bucketlist = current_user.bucketlists.find(params[:id])

        erb :"bucketlists/show.html"
    end

    post '/bucketlists' do
        @bucketlist = Bucketlist.new
        @bucketlist.name = params[:name]
        @bucketlist.user = current_user

        if !params[:country].present?
            flash[:notice] = "Please add country to your bucketlist"
            @continents = Continent.all
            erb :"bucketlists/new.html"
        elsif @bucketlist.save
            params[:country].each do |country_id|
                country = Country.find_by(id: country_id)
                BucketlistCountry.create(bucketlist: @bucketlist, country: country)
            end
            flash[:notice] = "Successfully created bucketlist."
            redirect "/bucketlists/#{@bucketlist.id}"
        else
            flash[:notice] = "You cannot use the same name as existing bucketlists"
            @continents = Continent.all
            erb :"bucketlists/new.html"
        end
    end

    delete '/bucketlists/:id' do
        @bucketlist = current_user.bucketlists.find(params[:id])
        @bucketlist.destroy

        redirect "/bucketlists"
    end

    get '/bucketlists/:id/edit' do
        @bucketlist = current_user.bucketlists.find(params[:id])

        erb :"bucketlists/edit.html"
    end

    patch '/bucketlists/:id' do
        @bucketlist = current_user.bucketlists.find(params[:id])
        @bucketlist.bucketlist_countries.where(id: params[:bucketlist_country]).update(visited: true) 
        @bucketlist.bucketlist_countries.where.not(id: params[:bucketlist_country]).update(visited: false)
        
        redirect "/bucketlists/#{@bucketlist.id}"
    end

   

end