class PatientsController < Clearance::UsersController
  def index
  end

  def edit
  end

  def show
  end

  def _form
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      sign_in @patient
      redirect_to root_path
    else
      flash[:notice] = "Failed to created..."
      redirect_to new_user_path
    end
  end

private
  def patient_params
  	params.require(:patient).permit(:first_name, :last_name, :password, :email)
  end
end
