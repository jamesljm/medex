class ChangeReferralColumnTypeInRecordsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :referral, :referral_note
    add_column :records, :referral, :boolean
  end
end
