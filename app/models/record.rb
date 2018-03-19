class Record < ApplicationRecord
  belongs_to  :booking, optional: true
  belongs_to  :patient, foreign_key: "patient_id", class_name: "Patient"
  has_many    :authorizations
  has_many     :prescriptions, dependent: :destroy
  has_many     :lab_tests

  scope :by_title, -> (title){ where("title ILIKE ?", "%#{title}%") }

  # def self.by_doctor_name
  #   doctor_ids = []
  #   current_user.records.each do |record|
  #     doctor_ids << record.doctor_id
  #   end
  #   Doctor.where("name ILIKE ?", params[:search_name])
    
  #   byebug
    
  # end
end
