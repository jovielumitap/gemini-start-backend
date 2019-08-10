class Body < ApplicationRecord
  belongs_to :body_type
  belongs_to :building
  has_many :outdoors
end
