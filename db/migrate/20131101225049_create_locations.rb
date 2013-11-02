class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country_code
      t.string :region_code
      t.string :city
      t.string :postal_code
      t.decimal :latitude, :precision=>10, :scale=>6
      t.decimal :longitude, :precision=>10, :scale=>6
      t.string :metro_code
      t.string :area_code

      t.timestamps
    end
    add_index :locations, :postal_code
  end
end
