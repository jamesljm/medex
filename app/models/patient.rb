class Patient < User
    has_one :health
    has_many :records, inverse_of: :patient
    has_many :bookings

    # validates :email, uniqueness: true
end
