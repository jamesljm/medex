class ClinicsController < ApplicationController

    def index
      @doctor = Doctor.find(params[:doctor_id])
      @clinic = Clinic.new
      @clinics = Clinic.all
      @doctors = Doctor.all

    end


    def create

      @doctor = Doctor.find(params[:doctor_id])
      @clinic = @doctor.clinics.new(clinic_params)
      @clinic.doctor_id = @doctor.id

      if @clinic.save
        @doctor = Doctor.find(params[:doctor_id])
        @clinic = Clinic.new
        @clinics = Clinic.all
        @doctors = Doctor.all
        
        # redirect_to doctor_clinics_path(@doctor)
      
      else
        flash[:notice] = "Failed to save..."
        # redirect_to new_doctor_clinic_path
      end

      respond_to do |format|
        format.js
      end

   end

    def edit
      @clinic = Clinic.find(params[:id])

      respond_to do |format|
        format.js
      end

    end

    def update
      @clinic = Clinic.find(params[:id])
        if @clinic.update(clinic_params)
          @doctor = Doctor.find(params[:doctor_id])
          @clinic = Clinic.new
          @clinics = Clinic.all
          @doctors = Doctor.all

        else
          render 'edit'
        end

      respond_to do |format|
        format.js
      end
      
    end

    def show
      @doctor = Doctor.find(params[:doctor_id])
      @clinic = Clinic.find(params[:id])

      respond_to do |format|
        format.js
      end
    end

    def destroy
      @doctor = Doctor.find(params[:doctor_id])
      @clinic = Clinic.find(params[:id])
      
      @clinic.destroy

      @clinics = Clinic.all
      @doctors = Doctor.all

      respond_to do |format|
        format.js
      end
    end

    def search
      @clinics = Clinic.where(nil)
      @clinics = @clinics.by_name(params[:name])
      respond_to do |format|
        format.js
      end
    end
private
  def clinic_params
    params.require(:clinic).permit(:name, :address, :city, :postcode, :country, :phone, :email, :doctor_id, :state, :booking, :fee, :duration, :operation_hour=>{})
  end

end
