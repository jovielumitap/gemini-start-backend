class Outdoor < ApplicationRecord
  belongs_to :component
  belongs_to :sub_component

  mount_uploader :attachment, OutdoorAttachmentUploader
end
