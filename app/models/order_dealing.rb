class OrderDealing
  include ActiveModel::Model
  attr_accessor :street_address_id, :municipality, :address, :building_name, :postal_code, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :street_address_id
    validates :municipality
    validates :address
    validates :postal_code
    validates :phone_number
    validates :user_id
    validates :item_id
  end

   def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Dealing.create(street_address_id: street_address_id, municipality: municipality, address: address, postal_code: postal_code, phone_number: phone_number, building_name: building_name, order_id: order.id)
   end
end
