class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :contact

      t.timestamps
    end
  end
end
