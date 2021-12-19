class RemoveBucketlistFromCountries < ActiveRecord::Migration[6.1]
  def change
    remove_column :countries, :bucketlist_id
  end
end
