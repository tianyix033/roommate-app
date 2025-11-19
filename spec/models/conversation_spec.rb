require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'validations' do
    it 'is invalid without both participants' do
      conversation = described_class.new(participant_one: User.new, participant_two: nil)

      expect(conversation).not_to be_valid
      expect(conversation.errors[:participant_two]).to include("can't be blank")
    end
  end
end

