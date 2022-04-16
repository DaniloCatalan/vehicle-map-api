class Waypoint < ApplicationRecord
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :sent_at, presence: true

  belongs_to :vehicle
end
