require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe '.search' do
    it 'returns all listings when no filters are provided' do
      user = User.create!(email: 'searcher@example.com', password: 'password123')
      listings = [
        Listing.create!(title: 'Cozy room', description: 'Near campus', price: 600, city: 'New York', user: user),
        Listing.create!(title: 'Downtown studio', description: 'Close to subway', price: 1200, city: 'Boston', user: user)
      ]

      results = described_class.search({})

      expect(results).to match_array(listings)
    end
  end
end
