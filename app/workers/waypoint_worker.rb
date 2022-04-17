class WaypointWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform(params, vehicle_identifier)
    vehicle = Vehicle.find_by(vehicle_identifier: vehicle_identifier)
    vehicle.waypoints.create(params)
  end
end
