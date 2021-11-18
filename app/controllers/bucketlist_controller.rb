class BucketlistController < ApplicationController
    before '/bucketlist/*' do #makes sure bucketlist are not available until user is logged in
        authentication_required
    end

    get '/bucketlist/new' do
        erb :"bucketlist/new.html"
    end

    get '/bucketlist/1' do
        "Hello"
    end

    post /bucketlist/new do
        "Hello"
    end
end