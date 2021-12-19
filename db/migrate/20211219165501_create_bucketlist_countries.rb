class CreateBucketlistCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlist_countries do |t|
      t.integer :bucketlist_id
      t.integer :country_id
      t.boolean :visited, default: false
    end
  end
end
