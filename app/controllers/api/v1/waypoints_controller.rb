class Api::V1::WaypointsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def gps
    @vehicle = Vehicle.find_by(vehicle_identifier: params[:vehicle_identifier])
    @vehicle = create_vechicle unless @vehicle.present?
    @waypoint = @vehicle.waypoints.create(latitude: params[:latitude],
                                          sent_at: params[:sent_at])
    if @waypoint.present?
      render json: @waypoint, status: 201
    else
      render json: @waypoint.errors, status: 500
    end

  end

  private

  def create_vechicle
    Vehicle.create(vehicle_identifier: params[:vehicle_identifier])
  end
end
