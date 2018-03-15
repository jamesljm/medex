class ChangeOperationHourColumnInClinics < ActiveRecord::Migration[5.2]
  def change
    change_column :clinics, :operation_hour, :text
  end
end
