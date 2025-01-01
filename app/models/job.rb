class Job < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :applications

  validates :title, presence: true
  validates :description, presence: true
end
