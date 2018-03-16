class Prescription < ApplicationRecord
  belongs_to :record, optional: true
  
end
