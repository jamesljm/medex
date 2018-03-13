class Health < ApplicationRecord
    belongs_to :patient, foreign_key: "patient_id", class_name: "Patient"
end
