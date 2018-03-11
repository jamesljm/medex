class Authorization < ApplicationRecord
  belongs_to :record
  belongs_to :doctor
end
