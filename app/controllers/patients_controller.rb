class PatientsController < Clearance::UsersController
  before_action :require_login, except: :create
  before_action :find_patient_with_id, only: [:edit, :update, :show, :destory]

  def index
  end

  def edit
  end

  def update
    
    if @patient.update(patient_params)
      redirect_to patient_path, notice: "Your record has been updated."
    else
      redirect_to patient_path, notice: "Update error."
    end
  end  

  def show
    @patient = current_user
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
  	params.require(:patient).permit(:first_name, :last_name, :password, :phone, :email, :gender, :birthdate, :identification, :blood_type, :family_history, :social_history, :drinker, :smoker, med_history: [], allergies: [] )
  end

  def find_patient_with_id
    @patient = Patient.find(params[:id])
  end
end
