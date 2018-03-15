class ChangeColumnsInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :med_history, "varchar[] USING (string_to_array(med_history, ','))"
    change_column :users, :allergies, "varchar[] USING (string_to_array(allergies, ','))"
  end
end
