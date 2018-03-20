class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      # user's data
      t.string      :first_name, null: false
      t.string      :last_name
      t.date        :birthdate
      t.string      :email, uniqueness: false
      t.integer     :gender, index: true
      t.string      :phone
      t.string      :identification
      t.string      :profile_picture

      # authentications
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      # timestamps
      t.timestamps  null: false      
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
