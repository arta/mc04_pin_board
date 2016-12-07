class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pin
  validates :body, presence:true # => won't save in 'comments#create' action
end
