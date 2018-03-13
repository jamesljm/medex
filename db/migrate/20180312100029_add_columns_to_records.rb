class AddColumnsToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :title, :string, limit: 255
    add_column :records, :encounter, :string, array: true
    add_column :records, :symptoms, :string
    add_column :records, :follow_up, :boolean

  end
end
