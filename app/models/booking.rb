class Booking < ApplicationRecord
  belongs_to  :doctor
  belongs_to  :user
  has_one     :record
end
