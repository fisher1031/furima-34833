class OrderDealing
  include ActiveModel::Model
  attr_accessor :street_address_id, :municipality, :address, :building_name, :postal_code, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }
  validates :street_address_id, presence: true, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Dealing.create(street_address_id: street_address_id, municipality: municipality, address: address, postal_code: postal_code,
                   phone_number: phone_number, building_name: building_name, order_id: order.id)
  end
end
