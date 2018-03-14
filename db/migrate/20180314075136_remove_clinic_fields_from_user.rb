class RemoveClinicFieldsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :clinic_name
    remove_column :users, :clinic_phone
    remove_column :users, :clinic_address
    remove_column :users, :clinic_city
    remove_column :users, :clinic_state
    remove_column :users, :clinic_country
    remove_column :users, :clinic_postcode
  end
end
