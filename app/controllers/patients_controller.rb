class PatientsController < Clearance::UsersController
  before_action :require_login, except: :create
  before_action :find_patient_with_id, only: [:edit, :update, :show, :destory]

  def index
    # @patients = []
    # @bookings = Booking.where(:doctor_id => current_user.id)
    # @bookings.each do |booking|
    #   @patient = Patient.where(:booking_id => booking.id)
    #   @patients << @patient
    # end
  end

  def edit
    
  end

  def profile
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.js
    end
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
    @user = current_user
    if current_user.type == 'Doctor'
      flash[:error] = "Invalid Token..."
      redirect_to root_path
    end
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      ExampleMailer.sample_email(@patient).deliver
      sign_in @patient
      redirect_to patient_path(@patient.id)
    else
      flash[:notice] = "Failed to created..."
      redirect_to new_user_path
    end
  end

  def card
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

private
  def patient_params
    params[:patient][:allergies].nil? ? params[:patient][:allergies] = [] : allergies = params[:patient][:allergies].split(',')
    params[:patient][:med_history].nil? ? params[:patient][:med_history] = [] : med_history = params[:patient][:med_history].split(',')
  	params.require(:patient).permit(:first_name, :last_name, :password, :phone, :email, :gender, :birthdate, :identification, :blood_type, :family_history, :social_history, :drinker, :smoker, :profile_picture, :remote_profile_picture_url).merge(med_history: med_history, allergies: allergies)
  end

  def find_patient_with_id
    @patient = Patient.find(params[:id])
  end

end
