require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is invalid without an email' do
      user = User.new(password: 'secret123')

      expect(user).not_to be_valid
      user.validate
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(email: 'test@example.com')

      expect(user).not_to be_valid
      user.validate
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid with a duplicate email' do
      User.create!(email: 'duplicate@example.com', password: 'secret123')
      user = User.new(email: 'duplicate@example.com', password: 'anothersecret')

      expect(user).not_to be_valid
      user.validate
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
