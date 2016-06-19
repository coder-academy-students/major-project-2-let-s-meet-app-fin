class ChangeInivitationUserToGuest < ActiveRecord::Migration
  def change
    rename_column :invitations, :user_id, :guest_id
  end
end
