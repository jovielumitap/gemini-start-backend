class Outdoor < ApplicationRecord
  belongs_to :component
  belongs_to :sub_component
end
