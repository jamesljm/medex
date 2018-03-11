class DoctorsController < Clearance::UsersController
  def index
  end

  def edit
  end

  def show
  end

  def _form
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      sign_in @doctor
      redirect_to root_path
    else
      flash[:notice] = "Failed to created..."
      redirect_to new_user_path
    end
  end

private
  def doctor_params
  	params.require(:doctor).permit(:first_name, :last_name, :password, :email)
  end
end
