class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :fee
  belongs_to :prefecture
  has_one :order

  validates :name, presence: true
  validates :info, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :fee, presence: true
  validates :prefecture, presence: true
  validates :delivery, presence: true
  validates :price, presence: true

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
