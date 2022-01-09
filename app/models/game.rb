class Game < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :members, through: :participants

  accepts_nested_attributes_for :participants

  before_save :set_uuid  

  def set_uuid
    generate_code = ""
    loop do
      generate_code = SecureRandom.hex(3).upcase
      game_code_exist = Game.find_by_uuid(generate_code).present?
      break game_code_exist
    end
    self.uuid = generate_code
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
