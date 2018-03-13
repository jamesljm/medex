class ChangeColumnNameInRecordsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :consultation_type, :diagnosis
  end
end
