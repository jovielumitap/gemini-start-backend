class Building < ApplicationRecord
  belongs_to :building_type
  has_many :bodies
end
