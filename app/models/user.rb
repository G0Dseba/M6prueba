class User < ApplicationRecord
  # Incluye módulos de Devise para autenticación
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define la relación con los modelos
  has_many :jobs
  has_many :applications

  # Validaciones para los campos adicionales
  validates :photo, presence: true
  validates :relevant_data, presence: true

  # Configuración de roles manual
  ROLE_USER = 0
  ROLE_ADMIN = 1

  def user?
    self.role == ROLE_USER
  end

  def admin?
    self.role == ROLE_ADMIN
  end

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= ROLE_USER
  end
end


