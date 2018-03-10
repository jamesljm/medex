class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    # === Doctor
    add_column :users, :booked_time,        :time
    add_column :users, :booked_date,        :date
    add_column :users, :specialist,         :string
    add_column :users, :experienced_years,  :integer
    add_column :users, :license,            :integer
    # clinic info
    add_column :users, :clinic_name,        :string
    add_column :users, :clinic_phone,       :string
    add_column :users, :clinic_address,     :string
    add_column :users, :clinic_city,        :string
    add_column :users, :clinic_state,       :string
    add_column :users, :clinic_country,     :string

    # === Patients
    add_column :users, :blood_type,         :string    
    add_column :users, :med_history,        :string
    add_column :users, :allergies,          :string
    add_column :users, :family_history,     :string
    add_column :users, :social_history,     :string
    add_column :users, :drinker,            :boolean
    add_column :users, :smoker,             :boolean
  end
end
