class ClinicsController < ApplicationController
    
    def index
      @doctor = Doctor.find(params[:doctor_id])
      @clinic = @doctor.clinics.all
    end


    def create

    @doctor = Doctor.find(params[:doctor_id])
    @clinic = @doctor.clinic.create(clinic_params)
    @clinic.doctor_id = @doctor.id

    redirect_to doctor_clinics_path(@doctor,@clinic)
   
   end

    def edit
      @clinic = Clinic.find(params[:id])
    end

    def update
      @clinic = Clinic.find(params[:id])
        if @clinic.update(clinic_params)
          redirect_to doctor_clinics_path(@doctor,@clinic)
        else
          render 'edit'
        end
    end



  private
  def clinic_params
    params.require(:clinic).permit(:name, :address, :city, :postcode, :country, :phone, :email, :doctor_id, :state, operation_hour:{})
  end

end
