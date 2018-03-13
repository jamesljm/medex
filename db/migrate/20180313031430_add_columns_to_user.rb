class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verify, :string #(Pending, Verified, Failed)
    add_column :users, :education, :string
    add_column :users, :qualifications, :string
    add_column :users, :clinic_postcode, :string
  end
end

