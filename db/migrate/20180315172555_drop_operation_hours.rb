class DropOperationHours < ActiveRecord::Migration[5.2]
  def change
    drop_table :operation_hours
  end
end
