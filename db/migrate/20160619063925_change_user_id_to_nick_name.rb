class ChangeUserIdToNickName < ActiveRecord::Migration
  def change
    rename_column :users, :user_id, :nick_name
  end
end
