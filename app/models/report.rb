class Report < ApplicationRecord
  belongs_to :reporter, class_name: 'User'
  belongs_to :reported_user, class_name: 'User'

  validates :report_type, presence: true
  validates :reporter, presence: true
  validates :reported_user, presence: true
end
