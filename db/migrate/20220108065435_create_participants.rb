class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.references :member
      t.references :game
      t.integer :score
      t.integer :status

      t.timestamps
    end
  end
end
