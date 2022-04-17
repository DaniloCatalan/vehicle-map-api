class Api::V1::WaypointsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :search_vehicle

  def show
    @waypoints = Waypoint.all.reverse_each.take(20)
  end

  def gps
    create_vechicle unless @vehicle.present?
    search_vehicle(params[:vehicle_identifier])
    message = @vehicle ? process_waypoint : { body: 'Not Found vehicle', status: 404 }
    render json: { status_waypoint: message[:body] }, status: message[:status]
  end

  private

  def process_waypoint
    job_id = WaypointWorker.perform_async(waypoint_params.to_h, @vehicle.vehicle_identifier)

    if (Sidekiq::Status.failed? job_id) || (Sidekiq::Status.interrupted? job_id)
      { body: 'Cant\'t process', status: 500 }
    else
      { body: 'Processing', status: 200 }
    end
  rescue StandardError
    { body: 'Service error', status: 500 }
  end

  def search_vehicle(identifier = nil)
    @vehicle = if identifier
                 Vehicle.find_by(vehicle_identifier: identifier)
               else
                 Vehicle.find_by(vehicle_identifier: params[:vehicle_identifier])
               end
  end

  def create_vechicle
    Vehicle.create(vehicle_identifier: params[:vehicle_identifier])
  end

  def waypoint_params
    params.require(:waypoint)
          .permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
  end
end
