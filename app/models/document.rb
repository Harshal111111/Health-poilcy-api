class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  has_attached_file :file
  validates_attachment_content_type :file, content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"]
end
