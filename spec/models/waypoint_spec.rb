require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  vehicle = Vehicle.create(vehicle_identifier: (0...50).map { ('a'..'z').to_a[rand(26)] }.join)
  subject { 
    described_class.new(latitude: '20.23',
                        longitude: '-0.56',
                        sent_at: '2016-06-02 20:45:00',
                        vehicle_id: vehicle.id) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without latitude' do
    subject.latitude = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without longitude' do
    subject.longitude = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without sent_at' do
    subject.sent_at = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:vehicle).without_validating_presence }
  end
end
