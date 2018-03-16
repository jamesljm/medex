class AddColumnToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :booking, :boolean
    add_column :clinics, :fee, :integer
    add_column :clinics, :duration, :integer
  end
end
