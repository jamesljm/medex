class PatientsController < Clearance::UsersController
  before_action :require_login, except: :create

  def index
  end

  def show
    @patient = current_user
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

  def dashboard

    case params[:request]
      when 'edit'
        @patient = find_patient_with_id
      when 'appointments'
        @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
        @bookings = Booking.where('patient_id=' + current_user.id.to_s)
      when 'journal'
        @records = current_user.records
      when 'prescriptions'

      else
        redirect_to root_path
    end

    # required for remote
    respond_to do |format|
      format.js
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
