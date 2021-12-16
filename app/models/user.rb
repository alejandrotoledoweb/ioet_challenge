class User < ApplicationRecord
  has_many :works, dependent: :destroy
end
