class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: '1~2日で発送' },
    { id: 3, category: '2~3日で発送' },
    { id: 4, category: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
