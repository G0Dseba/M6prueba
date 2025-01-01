class Job < ApplicationRecord
  belongs_to :user
  has_many :applications

  validates :title, presence: true
  validates :description, presence: true
end
