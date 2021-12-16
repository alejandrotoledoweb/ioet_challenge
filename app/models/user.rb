class User < ApplicationRecord
  has_many :works, dependent: :destroy

  validates_presence_of :name, uniqueness: true
end
