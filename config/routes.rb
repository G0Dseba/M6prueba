Rails.application.routes.draw do
  # Rutas para el HomeController
  get "home/index"

  # Rutas para Devise con Controlador Personalizado
  devise_for :users, controllers: {
    registrations: 'users'
  }
  
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

  # Ruta para perfiles de usuarios manejadas por el controlador personalizado
  resources :users, only: [:show, :edit, :update, :new, :create]
end