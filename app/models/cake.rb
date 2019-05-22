class Cake < ApplicationRecord
  searchkick word_middle: [:title]
  validates :title, presence: true

  monetize :price_cents, as: 'price', allow_nil: true
  mount_uploader :image, ImageUploader

  belongs_to :user
  # accepts_nested_attributes_for :user

  attr_accessor :image_cache


  private

  # def search_data
  #   {
  #     title: title
  #   }
  # end
  #

end
