class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :loc_id
      t.string :loc_name
      t.string :zone_id
      t.timestamps
    end
  end
end
