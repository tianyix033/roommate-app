require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'associations' do
    it { should belong_to(:reporter).class_name('User') }
    it { should belong_to(:reported_user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:report_type) }
    it { should validate_presence_of(:reporter) }
    it { should validate_presence_of(:reported_user) }
  end

  describe 'report_type validation' do
    it 'allows valid report types' do
      valid_types = ['Harassment', 'Spam', 'Inappropriate Content', 'Other']
      valid_types.each do |type|
        report = build(:report, report_type: type)
        expect(report).to be_valid
      end
    end
  end
end