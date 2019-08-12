class Body < ApplicationRecord
  belongs_to :body_type
  belongs_to :building

  scope :filter_by_building_id, -> (building_id) { where(building_id: building_id) }
end
