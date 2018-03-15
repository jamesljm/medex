class DoctorsController < Clearance::UsersController
  before_action :require_login, except: :create

  def home
  end

  def search
    if params[:search].blank?
      @doctors=Doctor.all
    else
      @doctors=Doctor.search(params)
    end
  end

  def index
    @doctor = Doctor.all
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
      if @doctor.update(doctor_params)
        redirect_to @doctor
      else
        render 'edit'
      end
  end

  def show
    @pending_booking=PendingBooking.where('doctor_id='+current_user.id.to_s)
    @booking=Booking.where('doctor_id='+current_user.id.to_s)
    @doctor = Doctor.find(params[:id])
    @doctor.verify = 'Pending'
  end


  def _form
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
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

private
  def doctor_params
  	params.require(:doctor).permit(:first_name, :last_name, :password, :email, :license, :verify, :phone, :birthdate, :specialist, :experienced_years, :education, :qualifications, :clinic_name, :clinic_phone, :clinic_address, :clinic_postcode, :clinic_city, :clinic_state, :clinic_country)
  end
end
