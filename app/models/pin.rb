class Pin < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence:true
  validates :title, length:{ minimum:5 }
end
