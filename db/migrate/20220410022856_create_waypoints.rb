class CreateWaypoints < ActiveRecord::Migration[6.1]
  def change
    create_table :waypoints do |t|
      t.string :latitude
      t.string :longitude
      t.datetime :sent_at
      t.timestamps
    end
  end
end
