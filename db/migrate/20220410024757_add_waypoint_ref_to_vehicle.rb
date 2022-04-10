class AddWaypointRefToVehicle < ActiveRecord::Migration[6.1]
  def up
    change_table :waypoints do |t|
      t.references :vehicle, index: true
    end
  end
end
