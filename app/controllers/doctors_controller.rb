class DoctorsController < Clearance::UsersController
  before_action :require_login, except: :create
  @@param4 = 0

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
    
    @doctors= @doctors.order(first_name: :desc).page(params[:page]).per(12)

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

    @doctors= @doctors.order(first_name: :desc).page(params[:page]).per(12)

    respond_to do |format|
      format.js
    end
  end


  def index
    @doctors = Doctor.all
    
    @doctors= Doctor.order(first_name: :desc).page(params[:page]).per(12)

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
    if current_user.type == "Patient"
      flash[:error] = "Invalid Token."
      redirect_to root_path
    end
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
    @checking= Like.where('patient_id='+current_user.id.to_s).where('doctor_id='+params[:id].to_s)
    @doctor = Doctor.find(params[:id])
    @like = Like.where('doctor_id='+params[:id])
    respond_to do |format|
      format.js
    end
  end

  def patient_profile
    @patients_list = Booking.where("doctor_id=" + params[:id].to_s) 
    @patients = Patient.all   
  end

  def patient_record
    @patients_list = Booking.where("doctor_id=" + params[:id].to_s)
  end

  def authorization
    if params[:auth_record_key].present?
      @auth_records = []
      @auth_params = params[:auth_record_key]
      @keys = Array.new(@auth_params.split(','))

      @keys.each do |key|
        @auth_records << Record.find_by(authorization_code: key) if Record.find_by(authorization_code: key) != nil
      end
    end

    @record = Record.find(params[:auth_record]) if params[:auth_record].present?

    respond_to do |format|
      format.js
    end
  end

private
  def doctor_params
  	params.require(:doctor).permit(:first_name, :last_name, :password, :gender, :email, :license, :verify, :phone, :birthdate, :specialist, :experienced_years, :education, :qualifications, :summary, :profile_picture, :remote_profile_picture_url)
  end
end
