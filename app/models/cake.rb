class Cake < ApplicationRecord
  monetize :price_cents, as: 'price', allow_nil: true

  belongs_to :user
  accepts_nested_attributes_for :user

end
