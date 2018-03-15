class OperationHour < ApplicationRecord
  # belongs_to :clinic

  

  # before_save :update_operation_hour



  # def update_operation_hour
  #   mon = @clinic.operation_hour.mon
  #   if mon.mon_status == 'Close'
  #     mon = 'Close'
  #   else 
  #     mon = mon.mon_start_hour + ":" + mon.mon_start_min + " - " + mon.mon_end_hour + ":"+ mon.mon_end_hour
  #   end
  # end

end
