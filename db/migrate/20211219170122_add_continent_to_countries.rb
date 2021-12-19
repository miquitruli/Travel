class AddContinentToCountries < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :continent_id, :integer
  end
end
