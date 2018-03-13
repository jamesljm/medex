class AddColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :patient
  end
end
