require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject { described_class.new(vehicle_identifier: (0...50).map { ('a'..'z').to_a[rand(26)] }.join) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without vehicle_identifier' do
    subject.vehicle_identifier = nil
    expect(subject).to_not be_valid
  end

  describe '.validation' do
    context 'when vehicle_identifier is not unique' do
      before { described_class.create!(vehicle_identifier: subject.vehicle_identifier) }
      it { expect(subject).to be_invalid }
    end

    context 'when vehicle_identifier is unique' do
      before { described_class.create!(vehicle_identifier: (0...50).map { ('a'..'z').to_a[rand(26)] }.join) }
      it { expect(subject).to be_valid }
    end
  end
end
