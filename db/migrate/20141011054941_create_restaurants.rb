class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :rest_id
      t.string :name
      t.string :location
      t.string :loc_id
      t.string :zone_name
      t.string :zone_id
      t.string :city_name
      t.string :city_id
      t.string :cuisines
      t.string :twitter_handle
      t.string :cost_for_two
      t.string :rating

      t.timestamps
    end
  end
end
