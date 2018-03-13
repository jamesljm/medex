class AddColumnsToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :prescriptions, :pres_start_date, :date
    add_column :prescriptions, :pres_end_date, :date
    add_column :prescriptions, :dosage, :string
    add_column :prescriptions, :meal, :boolean
    add_column :prescriptions, :morning, :string, limit: 255
    add_column :prescriptions, :noon, :string, limit: 255
    add_column :prescriptions, :night, :string, limit: 255
  end
end
