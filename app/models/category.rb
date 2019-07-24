class Category < ApplicationRecord
  has_many :users

  validates_uniqueness_of :name, :message => "This category already exists"
  scope :sort_by_id_asc, -> { order(id: :asc) }
end
