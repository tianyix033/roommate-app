require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'allows email to be optional' do
      user = described_class.new(email: nil, password: 'password123')
      expect(user).to be_valid
    end
  end

  describe 'attribute aliases' do
    it 'writes to display_name when name is assigned' do
      user = described_class.new

      expect { user.name = 'Test User' }.to change { user.display_name }.from(nil).to('Test User')
    end
  end

  describe 'associations' do
    it 'destroys associated listings when the user is destroyed' do
      user = described_class.create!(email: 'owner@example.com', password: 'password123')
      user.listings.create!(
        title: 'Test Listing',
        description: 'Sample',
        price: 500,
        city: 'New York',
        status: Listing::STATUS_PENDING,
        owner_email: user.email
      )

      expect { user.destroy }.to change { Listing.count }.by(-1)
    end
  end
end
