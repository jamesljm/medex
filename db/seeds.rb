# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  10.times do 
    user['type'] = 'Doctor'
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
    user['identification'] = rand(0000000001..9999999999)
    user['specialist'] = ['Endocrinologist', 'General Medical Physician', 'Cardiologist', 'Neurologist'].sample
    user['experienced_years'] = rand(1..20)
    user['license'] = rand(0000001..1234567)
    user["verify"] = rand(0..2)
    user['education'] = Faker::RickAndMorty.location
    user['qualifications'] = Faker::Educator.course

    User.create(user)
  end
end

clinic = {}
uids = []
Doctor.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  20.times do 
    clinic['name'] = Faker::App.name
    clinic['country'] = Faker::Address.country
    clinic['state'] = Faker::Address.state
    clinic['city'] = Faker::Address.city
    clinic['postcode'] = Faker::Address.zip_code
    clinic['address'] = Faker::Address.street_address
    clinic['email'] = Faker::Internet.email
    clinic['phone'] = Faker::PhoneNumber.phone_number
    clinic['booking'] = rand(0..1)
    clinic['fee'] = rand(20..200)
    clinic['duration'] = [15,20,25,30,35,40,45,50,55,60].sample
    clinic['operation_hour'] = {"mon_status"=>"Open", "mon_start(1i)"=>"1", "mon_start(2i)"=>"1", "mon_start(3i)"=>"1", "mon_start(4i)"=>"08", "mon_start(5i)"=>"", "mon_end(1i)"=>"1", "mon_end(2i)"=>"1", "mon_end(3i)"=>"1", "mon_end(4i)"=>"10", "mon_end(5i)"=>"", "tue_status"=>"Closed", "tue_start(1i)"=>"1", "tue_start(2i)"=>"1", "tue_start(3i)"=>"1", "tue_start(4i)"=>"", "tue_start(5i)"=>"", "tue_end(1i)"=>"1", "tue_end(2i)"=>"1", "tue_end(3i)"=>"1", "tue_end(4i)"=>"", "tue_end(5i)"=>"", "wed_status"=>"Closed", "wed_start(1i)"=>"1", "wed_start(2i)"=>"1", "wed_start(3i)"=>"1", "wed_start(4i)"=>"", "wed_start(5i)"=>"", "wed_end(1i)"=>"1", "wed_end(2i)"=>"1", "wed_end(3i)"=>"1", "wed_end(4i)"=>"", "wed_end(5i)"=>"", "thu_status"=>"Open", "thu_start(1i)"=>"1", "thu_start(2i)"=>"1", "thu_start(3i)"=>"1", "thu_start(4i)"=>"", "thu_start(5i)"=>"", "thu_end(1i)"=>"1", "thu_end(2i)"=>"1", "thu_end(3i)"=>"1", "thu_end(4i)"=>"", "thu_end(5i)"=>"", "fri_status"=>"Open", "fri_start(1i)"=>"1", "fri_start(2i)"=>"1", "fri_start(3i)"=>"1", "fri_start(4i)"=>"", "fri_start(5i)"=>"", "fri_end(1i)"=>"1", "fri_end(2i)"=>"1", "fri_end(3i)"=>"1", "fri_end(4i)"=>"", "fri_end(5i)"=>"", "sat_status"=>"Open", "sat_start(1i)"=>"1", "sat_start(2i)"=>"1", "sat_start(3i)"=>"1", "sat_start(4i)"=>"", "sat_start(5i)"=>"", "sat_end(1i)"=>"1", "sat_end(2i)"=>"1", "sat_end(3i)"=>"1", "sat_end(4i)"=>"", "sat_end(5i)"=>"", "sun_status"=>"Closed", "sun_start(1i)"=>"1", "sun_start(2i)"=>"1", "sun_start(3i)"=>"1", "sun_start(4i)"=>"", "sun_start(5i)"=>"", "sun_end(1i)"=>"1", "sun_end(2i)"=>"1", "sun_end(3i)"=>"1", "sun_end(4i)"=>"", "sun_end(5i)"=>"", "hol_status"=>"Closed", "hol_start(1i)"=>"1", "hol_start(2i)"=>"1", "hol_start(3i)"=>"1", "hol_start(4i)"=>"", "hol_start(5i)"=>"", "hol_end(1i)"=>"1", "hol_end(2i)"=>"1", "hol_end(3i)"=>"1", "hol_end(4i)"=>"", "hol_end(5i)"=>""}

    clinic['doctor_id'] = uids.sample

    Clinic.create(clinic)
  end
end
