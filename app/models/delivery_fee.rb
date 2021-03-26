class DeliveryFee < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: '着払い(購入者負担)' },
    { id: 3, category: '送料込み(出品者負担)' },
  ]

  include ActiveHash::Associations
  has_many :items

end