class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.integer :bucketlist_id
      t.string :name
    end
  end
end
