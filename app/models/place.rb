class Place < ApplicationRecord
  has_many :visits

  validates :name, presence: true, uniqueness: true
end
