class Outdoor < ApplicationRecord
  belongs_to :component
  belongs_to :sub_component
  belongs_to :body

  mount_uploader :attachment, OutdoorAttachmentUploader
end
