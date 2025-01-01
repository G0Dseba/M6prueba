Rails.application.routes.draw do
  # Rutas para el HomeController
  get "home/index"

  # Rutas para Devise
  devise_for :users
  
  # Rutas para Ofertas Laborales
  resources :jobs do
    member do
      post 'apply', to: 'jobs#apply'
    end
  end

  # Rutas para Postulaciones
  resources :applications
  
  # Verificar salud de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Definir la ruta raíz para la página de inicio
  root "home#index"
  
  # Rutas para perfiles de usuarios y sus postulaciones
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'applications', to: 'users#applications'
    end
  end

  # Ruta para el administrador Esteban
  namespace :admin do
    resources :users, only: [:index, :create, :new]
    resources :jobs, only: [:index, :new, :create]
  end
end
