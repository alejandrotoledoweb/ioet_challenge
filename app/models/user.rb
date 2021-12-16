class User < ApplicationRecord
  has_many :works, dependent: :destroy

  validates_presense_of :name, uniqueness: true
end
