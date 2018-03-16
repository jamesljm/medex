class Doctor < User
    has_many :bookings
    has_many :likes
    has_many :authorizations
    has_many :clinics

    mount_uploader :profile_picture, ProfilePictureUploader

  # validates :email, uniqueness: true
  if @current_user != nil
    validates :license, presence: true
  end 

  def self.search(params)
    doctors = Doctor.where("lower(first_name) LIKE ? or lower(last_name) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%") if params[:search].present?
    doctors
  end

  def self.search_specialist(params)
    doctors = Doctor.where("lower(specialist) LIKE ?", "%#{params[:search].downcase}%") if params[:search].present?
    doctors
  end

end
