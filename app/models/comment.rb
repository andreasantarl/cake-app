class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cake

  validates :comment, presence: true, allow_blank: false
  validates :user_id, presence: true
end
