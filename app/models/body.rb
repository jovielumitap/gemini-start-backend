class Body < ApplicationRecord
  belongs_to :body_type
  belongs_to :building
  has_many :floors
  has_many :rents

  scope :filter_by_building_id, -> (building_id) { where(building_id: building_id) }
end
