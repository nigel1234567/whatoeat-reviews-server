class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
