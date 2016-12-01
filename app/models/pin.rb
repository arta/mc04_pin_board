class Pin < ApplicationRecord
  validates :title, :description, presence:true
  validates :title, length:{ minimum:5 }
end
