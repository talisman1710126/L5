class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  validates :uid, presence: true, uniqueness: true
end
