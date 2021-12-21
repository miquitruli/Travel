class Bucketlist < ActiveRecord::Base
    belongs_to :user
    has_many :bucketlist_countries
    has_many :countries, through: :bucketlist_countries

    validates_uniqueness_of :name, scope: :user_id #makes sure bucketlist name is unique
    validates :name,  presence: true
end