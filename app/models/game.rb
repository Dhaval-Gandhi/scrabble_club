class Game < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :members, through: :participants

  before_save :set_uuid  

  def set_uuid
    self.uuid = SecureRandom.hex
  end

  def update_participants_status
    game_participants = self.participants.order(score: :desc).ids
    if game_participants.count <= 1
      self.update(status: 'winner')
    else
      Participant.where(id: game_participants.shift).update(status: 'winner')
      Participant.where(id: game_participants).update(status: 'loser')
    end
  end

end
