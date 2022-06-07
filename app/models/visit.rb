class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :place, class_name: "Place", foreign_key: "place_id"
end
