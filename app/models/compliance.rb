class Compliance < ApplicationRecord
  has_many :documents
  has_many :certificates
end
