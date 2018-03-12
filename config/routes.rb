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
<<<<<<< HEAD
  # resources :doctors
  resources :doctors do
    member do
      get 'profile' => 'doctors#profile', as: "profile", action: "profile"
    end
  end

  resources :patients do
    member do
      get 'profile' => 'patients#profile', as: "profile", action: "profile"
    end
  end
=======
  resources :doctors

  resources :patients
>>>>>>> master

  resources :bookings

  resources :records
  # === Home Page
  root :to => "pages#index"

  # === Logins
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
