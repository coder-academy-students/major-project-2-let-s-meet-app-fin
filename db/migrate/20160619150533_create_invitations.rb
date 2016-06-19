class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :is_going

      t.timestamps null: false
    end
  end
end
