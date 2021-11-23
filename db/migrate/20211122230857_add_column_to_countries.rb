class AddColumnToCountries < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :visited, :boolean
  end
end
