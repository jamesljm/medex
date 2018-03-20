# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs

user = {}
user['password'] = 'asdf'
x = 25

ActiveRecord::Base.transaction do
  5.times do 
    user['type'] = 'Doctor'
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(0..3)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
    user['identification'] = rand(0000000001..9999999999)
    user['specialist'] = ['Endocrinologist', 'General Medical Physician', 'Cardiologist', 'Neurologist','Dentist','Psychiatrist','Obstetrician & Gynaecologist'].sample
    user['experienced_years'] = rand(1..20)
    user['license'] = rand(0000001..1234567)
    user["verify"] = rand(0..2)
    user['education'] = Faker::RickAndMorty.location
    user['qualifications'] = Faker::Educator.course
    user['summary'] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    user['remote_profile_picture_url'] = "https://placeimg.com/200/200/face="+x.to_s
    User.create(user)
    x =+ 1
  end
end

clinic = {}
uids = []
Doctor.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  5.times do 
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
    clinic['operation_hour'] = {"mon_status"=>"Open", "mon_start(1i)"=>"1", "mon_start(2i)"=>"1", "mon_start(3i)"=>"1", "mon_start(4i)"=>"09", "mon_start(5i)"=>"00", "mon_end(1i)"=>"1", "mon_end(2i)"=>"1", "mon_end(3i)"=>"1", "mon_end(4i)"=>"05", "mon_end(5i)"=>"30", "tue_status"=>"Open", "tue_start(1i)"=>"1", "tue_start(2i)"=>"1", "tue_start(3i)"=>"1", "tue_start(4i)"=>"09", "tue_start(5i)"=>"00", "tue_end(1i)"=>"1", "tue_end(2i)"=>"1", "tue_end(3i)"=>"1", "tue_end(4i)"=>"", "tue_end(5i)"=>"", "wed_status"=>"Open", "wed_start(1i)"=>"1", "wed_start(2i)"=>"1", "wed_start(3i)"=>"1", "wed_start(4i)"=>"09", "wed_start(5i)"=>"00", "wed_end(1i)"=>"1", "wed_end(2i)"=>"1", "wed_end(3i)"=>"1", "wed_end(4i)"=>"05", "wed_end(5i)"=>"30", "thu_status"=>"Open", "thu_start(1i)"=>"1", "thu_start(2i)"=>"1", "thu_start(3i)"=>"1", "thu_start(4i)"=>"09", "thu_start(5i)"=>"00", "thu_end(1i)"=>"1", "thu_end(2i)"=>"1", "thu_end(3i)"=>"1", "thu_end(4i)"=>"05", "thu_end(5i)"=>"30", "fri_status"=>"Open", "fri_start(1i)"=>"1", "fri_start(2i)"=>"1", "fri_start(3i)"=>"1", "fri_start(4i)"=>"09", "fri_start(5i)"=>"00", "fri_end(1i)"=>"1", "fri_end(2i)"=>"1", "fri_end(3i)"=>"1", "fri_end(4i)"=>"05", "fri_end(5i)"=>"30", "sat_status"=>"Open", "sat_start(1i)"=>"1", "sat_start(2i)"=>"1", "sat_start(3i)"=>"1", "sat_start(4i)"=>"09", "sat_start(5i)"=>"00", "sat_end(1i)"=>"1", "sat_end(2i)"=>"1", "sat_end(3i)"=>"1", "sat_end(4i)"=>"12", "sat_end(5i)"=>"00", "sun_status"=>"Closed", "sun_start(1i)"=>"1", "sun_start(2i)"=>"1", "sun_start(3i)"=>"1", "sun_start(4i)"=>"", "sun_start(5i)"=>"", "sun_end(1i)"=>"1", "sun_end(2i)"=>"1", "sun_end(3i)"=>"1", "sun_end(4i)"=>"", "sun_end(5i)"=>"", "hol_status"=>"Closed", "hol_start(1i)"=>"1", "hol_start(2i)"=>"1", "hol_start(3i)"=>"1", "hol_start(4i)"=>"", "hol_start(5i)"=>"", "hol_end(1i)"=>"1", "hol_end(2i)"=>"1", "hol_end(3i)"=>"1", "hol_end(4i)"=>"", "hol_end(5i)"=>""}

    clinic['doctor_id'] = 12

    Clinic.create(clinic)
  end
end

med = ["Artificial heart valve","Back problems","Cancer","Cortisone treatment","Dizziness", "AIDS", "Head injuries", "Artificial joints", "Chemical dependency", "Anemia", "Chemotherapy", "Arthtitis Rheumatism", "Diabetic", "Gout", "HIV positive", "Kidney disease", "Hemophilia", "Heart pacemaker", "Heart problems/attack", "Hip replacement", "Drug addiction", "High blood pressure", "Mental disorder", "Blood transfusion", "Epilepsy/seizures"]
allergen = ["“Egg”, “Fish or shellfish”, “Fruit”, “Gluten”, “Garlic”, “Hot peppers”, “Oats”, “Meat”, “Milk”, “Peanut”, “Rice”, “Sesame”, “Soy”, “Sulfites”, “Tartrazine”, “Tree nut”, “Wheat”, “Tetracycline”, “Dilantin”, “Tegretol (carbamazepine)”, “Penicillin”, “Cephalosporins”, “Sulfonamides”, “Non-steroidal anti-inflammatories(cromolyn sodium, nedocromil sodium, etc.)”, “Intravenous contrast dye”, “Local anesthetics”, “Pollen”, “Cat”, “Dog”, “Insect sting”, “Mold”, “Perfume”, “Cosmetics”, “Latex”, “Water”, “House dust mite”, “Nickel (nickel sulfate hexahydrate)”, “Gold (gold sodium thiosulfate)”, “Chromium”, “Cobalt chloride”, “Formaldehyde”, “Photographic developers”, “Fungicide”, “Paraphenylenediamine (PPD)”, “Glyceryl monothioglycolate”"]
social = ["alcohol", "drug", "tobacco", "prison", "diet", "abuse victim", "crime victim", "homeless"] 
x = 25
ActiveRecord::Base.transaction do
  5.times do 

    user['type'] = 'Patient'
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(0..3)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
    user['identification'] = "9#{rand(0..9)}#{rand(01..12)}#{rand(00..30)}-#{rand(00..99)}-#{rand(0000..9999)}"
    user["password"] = 123
    user['blood_type'] = "#{['O', 'A', 'B'].sample}#{["-","+"].sample}"
    user['med_history'] = [med.sample, med.sample, med.sample, med.sample, med.sample]
    user['allergies'] = [allergen.sample, allergen.sample, allergen.sample, allergen.sample, allergen.sample]
    user["family_history"] = "#{med.sample}, #{med.sample}, #{med.sample}"
    user['social_history'] = "#{social.sample}, #{social.sample}, #{social.sample}"
    user['drinker'] = rand(0..1)
    user['smoker'] = rand(0..1)
    user['remote_profile_picture_url'] = "https://placeimg.com/200/200/face="+x.to_s

    User.create(user)
  end
end


booking = {}
puids = []
Patient.all.each { |p| puids << p.id }

ActiveRecord::Base.transaction do
  10.times do 
    booking ["date"] = Faker::Date.between(1.year.ago, 1.year.from_now)
    booking ["start_time"] = "9am-10am"
    booking ["doctor_id"] = 5
    booking ["patient_id"] = 6
    booking ["bill"] = rand(0..1)
    booking ["total_price"] = rand(50..100000)

    Booking.create(booking)
  end
end

record = {}
buids = []
Booking.where(:doctor_id => 5, :patient_id => 6).each { |b| buids << b.id }

ActiveRecord::Base.transaction do
  100.times do 
    b = buids.sample
    
    record ["encounter"] = [["Consultation", "Followup", "Procedures", "Immunizations", "Labtests"].sample]
    record ["title"] = med.sample
    record ["booking_id"] = b
    record ["record_date"] = Booking.find(b).date
    record ["patient_id"] = Booking.find(b).patient_id
    record ["referral_note"] = ["Refer to specialist", "Refer for lab test", "Hospitalization for monitoring", "Colonoscopy to evaluate the colon for presence of polyps or tumors", "Require follow-up visit next week", "ICU", "No referral needed"].sample
    record ["note"]= ["Advised patient to drink less coke", "Advised patient to smoke less", "Patient to monitor blood sugar level", "Therapeutic plan: Continue Prozac 20mg po qd for now. Consider switching to a different anti-depressant. Discuss counseling and therapy options."].sample
    record ["diagnosis"] = med.sample
    record ["symptoms"] = "Vital signs: Ht 5’10” Wt 160lbs HR 72 RR 16 BP 126/78 Temp Not measured

    General: Mr. H is a depressed-appearing white male in no acute distress.

    HEENT: Not examined

    Lymph nodes: Non-tender, no palpable masses

    Neck: No masses

    Cardiovascular: Regular rate and rhythm; normal S1, S2; no murmurs, rubs, or gallops

    Lungs: Lungs clear to auscultation bilaterally; No wheezes or crackles

    Abdominal:

    Abdomen soft and non-distended with no scars or striations
    No pulsatile masses, no abdominal bruits ascultated
    Spleen not palpable, liver not palpable
    Tender to palpation in epigastric region and left upper quadrant; No reflex tenderness; No guarding; Murphy’s sign negative
    Rectal: Hemoccult positive

    Genito-urinary: Not examined

    Neurologic: Not examined

    Muskuloskeletal: Not examined

    Laboratory Data: None collected

    Diagnostic Tests: Hemoccult positive stool

    Problem List
    Abdominal pain, bloody stools
    Depression
    Hypertension
    Problem #1: Abdominal pain, bloody stools

    Differential diagnosis: colorectal adenocarcinoma, gastric ulcer, duodenal ulcer, GERD, intestinal obstruction, anxiety or depression related, abdominal aortic aneurysm, pancreatitis, pancreatic cancer"
    record ["follow_up"] = rand(0..1)
    record ["referral"] = rand(0..1)

    Record.create(record)
  end
end