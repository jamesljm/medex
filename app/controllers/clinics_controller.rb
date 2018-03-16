class ClinicsController < ApplicationController

    def index
      @doctor = Doctor.find(params[:doctor_id])
      @clinic = Clinic.new
      # @clinic.build_operation_hour
      @clinics = Clinic.all
      @doctors = Doctor.all

      respond_to do |format|
        format.js
      end
    end


    def create

      @doctor = Doctor.find(params[:doctor_id])
      @clinic = @doctor.clinics.new(clinic_params)
      @clinic.doctor_id = @doctor.id

      if @clinic.save
        redirect_to doctor_clinics_path(@doctor)
      else
        flash[:notice] = "Failed to save..."
        redirect_to new_doctor_clinic_path
      end

      

   end

    def edit
      @clinic = Clinic.find(params[:id])
    end

    def update
      @clinic = Clinic.find(params[:id])
        if @clinic.update(clinic_params)
          redirect_to doctor_clinics_path(@doctor)
        else
          render 'edit'
        end
    end



  private
  def clinic_params
    params.require(:clinic).permit(:name, :address, :city, :postcode, :country, :phone, :email, :doctor_id, :state, :operation_hour=>{})
  end

end
