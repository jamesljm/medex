class ChangeLikesUsersName < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :user_id, :patient_id
  end
end
