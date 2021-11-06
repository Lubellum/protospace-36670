class Prototype < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many   :comments, dependent: :destroy
  
  validates :image,      presence: true
  validates :title,      presence: true
  validates :catch_copy, presence: true
  validates :concept,    presence: true
end
