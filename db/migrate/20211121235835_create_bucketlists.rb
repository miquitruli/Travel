class CreateBucketlists < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlists do |t|
      t.integer :user_id
      t.string :name
    end
  end
end
