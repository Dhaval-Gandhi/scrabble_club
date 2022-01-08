class Member < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :games, through: :participants

  validates :name, presence: true
  validates :email, presence: true

end