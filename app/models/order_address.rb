class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :price, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :user_id
    validates :city
    validates :house_number
    validates :token
    validates :item_id
    validates :phone_number, presence: true,
                             length: { minimum: 10, maximum: 11, message: 'is invalid (should be 10 or 11 characters)' }, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(postal_code:, prefecture_id:, city:, house_number:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
