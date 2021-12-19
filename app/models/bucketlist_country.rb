class BucketlistCountry < ActiveRecord::Base
    belongs_to :country
    belongs_to :bucketlist
end