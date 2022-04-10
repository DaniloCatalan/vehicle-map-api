class Vehicle < ApplicationRecord
  validates :vehicle_identifier, presence: true, uniqueness: true

  has_many :waypoints, dependent: :destroy
end
