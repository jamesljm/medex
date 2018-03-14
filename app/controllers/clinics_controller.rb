class ClinicsController < ApplicationController
  

  private
  def doctor_params
    params.require(:clinic).permit(:name, :address, :city, :postcode, :country, :phone, :email, operation_hour:{}, :doctor_id)
  end

end
