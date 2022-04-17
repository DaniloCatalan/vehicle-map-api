class Vehicle < ApplicationRecord
  validates :vehicle_identifier, presence: true, uniqueness: true

  has_many :waypoints, dependent: :destroy
  accepts_nested_attributes_for :waypoints, reject_if: :new_record?
end
