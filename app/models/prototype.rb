class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :title, :catch_copy, :concept, :image, presence: true

end
