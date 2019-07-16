class Cake < ApplicationRecord
  resourcify

  searchkick word_middle: [:title]
  validates :title, presence: true

  monetize :price_cents, as: 'price', allow_nil: true
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy

  attr_accessor :image_cache


  private

  # def search_data
  #   {
  #     title: title
  #   }
  # end
  #

end
