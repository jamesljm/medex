Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "sessions", only: [:create]

  resource :session, controller: "sessions", only: [:create_patient, :create_doctor] do
    collection do
      post :create_patient
      post :create_doctor
    end
  end

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # Doctor & Patients
  # resources :doctors
  resources :doctors do
    resources :clinics
    member do
      get 'profile' => 'doctors#profile', as: "profile", action: "profile"
      get 'dashboard/:request' => 'patients#dashboard', as: 'dashboard', action: 'dashboard'
      get 'card' => 'doctors#card', as: "card", action: "card"
      get 'appointment' => 'doctors#appointment', as: "appointment", action: "appointment"
    end

    collection do
      get :search #creates a new path for the searching 
      get :search_specialist
      get :search_location
    end
  end

  resources :patients do
    member do
      get 'profile/:id' => 'patients#profile', as: "profile", action: "profile" 
      get 'card' => 'patients#card', as: "card", action: "card"
    end
  end

  resources :bookings

  resources :records do
    resources :prescriptions
  end

  resources :pending_bookings

  resources :before_pay_bookings

  resources :subscribers

  resources :pages do
    collection do
      get 'payment/:booking_id' => 'pages#payment', as: "payment", action: "payment"
      get 'confirm/:booking_id' => 'pages#confirm', as: 'confirm', action: 'confirm'
    end
  end

  # === Home Page
  root :to => "pages#index"

  # === Logins
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
