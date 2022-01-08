class Participant < ApplicationRecord
  enum status: [:loser, :winner]

  belongs_to :member
  belongs_to :game

  validates :score, presence: true

end
