# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

user = {}
user['password'] = 'asdf'
user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['type'] = 'Doctor'
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['country'] = Faker::Address.country
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
    user['identification'] = rand(0000000001..9999999999)
    user['specialist'] = ['Endocrinologist, General Medical Physician, Cardiologist, Neurologist'].sample
    user['experienced_years'] = rand(1..20)
    user['license'] = rand(0000001..1234567)
    user['clinic_name'] = Faker::Company.name
    user['clinic_phone'] = Faker::PhoneNumber.phone_number
    user['clinic_address'] = Faker::Address.street_address
    user['clinic_city'] = Faker::Address.city
    user['clinic_state'] = Faker::Address.state
    user['clinic_country'] = Faker::Address.country
    user['clinic_postcode'] = Faker::Address.postcode
    user["verify"] = rand(0..2)
    user['education'] = Faker::RickAndMorty.location
    user['qualifications'] = Faker::Educator.course

    User.create(user)
  end
end