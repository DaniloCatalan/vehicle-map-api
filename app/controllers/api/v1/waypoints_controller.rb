class Api::V1::WaypointsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_vehicle

  def show
    @waypoints = Waypoint.all.reverse_each.take(20)
  end

  def gps
    @vehicle = create_vechicle unless @vehicle.present?

    @waypoint = @vehicle.waypoints.create(waypoint_params)

    if @waypoint.id
      render json: @waypoint, status: 201
    else
      render json: @waypoint, status: 500
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find_by(vehicle_identifier: params[:vehicle_identifier])
  end

  def create_vechicle
    Vehicle.create(vehicle_identifier: params[:vehicle_identifier])
  end

  def waypoint_params
    params.require(:waypoint)
          .permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
  end
end
