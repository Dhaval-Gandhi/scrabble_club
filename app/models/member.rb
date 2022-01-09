class Member < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :games, through: :participants

  validates :name, presence: true
  validates :email, presence: true  

  def self.top10_members
    sql = 'select members.name, member_avg_score.game_count, member_avg_score.avg_score from (select count(*) as "game_count", participants.member_id, round(avg(participants.score),2) as "avg_score" from participants group by participants.member_id) as "member_avg_score"inner join members on member_avg_score.member_id = members.id where member_avg_score.game_count >= 10 order by member_avg_score.avg_score desc'
    # sql = 'select members.name, member_avg_score.game_count, member_avg_score.avg_score from (select count(*) as "game_count", participants.member_id, round(avg(participants.score),2) as "avg_score" from participants group by participants.member_id) as "member_avg_score"inner join members on member_avg_score.member_id = members.id order by member_avg_score.avg_score desc'
    results = ActiveRecord::Base.connection.execute(sql)
    eval(results.to_json)
  end

  def avrage_score
    participants.average(:score).to_i
  end

  def game_count
    participants.count
  end

  def winning_games_count
    participants.where(status: 'winner').count
  end

  def loseing_games_count
    participants.where(status: 'loser').count
  end

  def rank_details
    participant = participants.order(score: :desc).first
    return nil if participant.blank?

    game = participant.game
    another_palyer = game.participants.where.not(member_id: participant.member_id).last.member.name
    return {highest_score: participant.score, game_code: game.uuid, game_time: game.created_at, another_player: another_palyer}
  end

end