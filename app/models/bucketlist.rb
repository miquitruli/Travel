class Bucketlist < ActiveRecord::Base
    belongs_to :user
    has_many :countries, through: :bucketlist_countries
end