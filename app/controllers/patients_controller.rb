class PatientsController < Clearance::UsersController
  before_action :require_login, except: :create

  def index
  end

  def edit
    find_patient_with_id
  end

  def show
    @user = current_user
    @pending_booking= PendingBooking.where('patient_id='+current_user.id.to_s)
    @booking=Booking.where('patient_id='+current_user.id.to_s)
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      sign_in @patient
      redirect_to patient_path(@patient.id)
    else
      flash[:notice] = "Failed to created..."
      redirect_to new_user_path
    end
  end

private
  def patient_params
  	params.require(:patient).permit(:first_name, :last_name, :password, :email)
  end

  def find_patient_with_id
    @patient = Patient.find(params[:id])
  end
end
