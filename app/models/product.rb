class Product < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many_attached :photos
end
