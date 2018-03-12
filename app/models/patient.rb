class Patient < User
    has_one :health
    has_many :records
    has_many :bookings

    # validates :email, uniqueness: true
end
