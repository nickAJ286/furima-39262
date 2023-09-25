class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :municipality, :street_address, :building_name, :phone_number,
                :token

  validates :post_number, presence: true,
                          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :municipality, :street_address, :user_id, :item_id, :token
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' },
                             length: { in: 10..11, message: 'is too short' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_number: post_number, prefecture_id: prefecture_id, municipality: municipality,
                       street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
