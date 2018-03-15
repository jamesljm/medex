class AddFieldToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :state, :string
  end
end
