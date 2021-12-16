class Work < ApplicationRecord
  belongs_to :user

  validates_presense_of :user, :date, :start_time, :end_time
end
