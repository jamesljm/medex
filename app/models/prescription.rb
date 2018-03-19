class Prescription < ApplicationRecord
  belongs_to :record, optional: true, foreign_key: "record_id", class_name: "Record"
  
end
