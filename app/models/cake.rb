class Cake < ApplicationRecord
  monetize :price_cents, as: 'price', allow_nil: true
  mount_uploader :image, ImageUploader

  belongs_to :user
  accepts_nested_attributes_for :user

  attr_accessor :image_cache

end
