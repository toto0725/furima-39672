class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  belongs_to :Category

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

end
