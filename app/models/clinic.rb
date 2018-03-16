class Clinic < ApplicationRecord
  belongs_to :doctor

  store :operation_hour
  # has_one :operation_hour, dependent: :destroy

  # accepts_nested_attributes_for :operation_hour, allow_destroy: true

  # after_save :update_time

  # def update_time
  #   p "hi"
  #   Clinic.last.operation_hour.each_key do |k,v|
  #     if v == ""
  #       Clinic.last.operation_hour[k] = "00"
  #     end
  #   end
  # end

end

