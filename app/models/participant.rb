class Participant < ApplicationRecord
  enum status: [:loser, :winner]

  belongs_to :member
  belongs_to :game

  validates :member_id, uniqueness: { scope: :game_id }
  validates :score, presence: true

end
