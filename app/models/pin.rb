class Pin < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :description, presence:true
  validates :title, length:{ minimum:5 }
end