class ClinicsController < ApplicationController
    
    def create

    @doctor = Doctor.find(params[:doctor_id])
    @clinic = @doctor.clinic.create(clinic_params)

    redirect_to doctor_clinics_path(@doctor,@clinic)
   
   end

    def edit
      @clinic = Clinic.find(params[:id])
    end

  def update
    @clinic = Clinic.find(params[:id])
      if @doctor.update(doctor_params)
        redirect_to @doctor
      else
        render 'edit'
      end
  end


  def index
    @doctor = Doctor.find(params[:doctor_id])
    @clinic = @doctor.clinics.all
  end

  private
  def clinic_params
    params.require(:clinic).permit(:name, :address, :city, :postcode, :country, :phone, :email, :doctor_id, :state, operation_hour:{})
  end

end
