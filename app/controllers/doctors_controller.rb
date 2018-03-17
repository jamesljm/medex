class DoctorsController < Clearance::UsersController
  before_action :require_login, except: :create

  def appointment
    @pending_bookings = PendingBooking.where('doctor_id='+current_user.id.to_s)
    @bookings = Booking.where('doctor_id=' + current_user.id.to_s)

    respond_to do |format|
      format.js
    end
  end

  def search
    if params[:search_name].blank?
      @doctors = Doctor.all
    else
      @doctors = Doctor.search(params[:search_name])
    end
    respond_to do |format|
      format.js
    end
  end

  def search_specialist
    if params[:search_specialist].blank?
      @doctors = Doctor.all
    else
      @doctors = Doctor.search_specialist(params[:search_specialist])
    end
    respond_to do |format|
      format.js
    end
  end

  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.js
    end
  end

  def edit
    @pending_booking=PendingBooking.where('doctor_id='+current_user.id.to_s)
    @booking=Booking.where('doctor_id='+current_user.id.to_s)
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
      if @doctor.update(doctor_params)
        redirect_to doctor_path
      else
        render 'edit'
      end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.verify = 'Pending'

    if @doctor.save
      ExampleMailer.sample_email(@doctor).deliver
      sign_in @doctor
      redirect_to doctor_path(@doctor.id)
    else
      flash[:notice] = "Failed to created..."
      redirect_to new_user_path
    end
  end

  def profile
    @doctor = Doctor.find(params[:id])
  end

  def card
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def patient_profile
    @patients = D
  end

private
  def doctor_params
  	params.require(:doctor).permit(:first_name, :last_name, :password, :email, :license, :verify, :phone, :birthdate, :specialist, :experienced_years, :education, :qualification, :summary)
  end
end
