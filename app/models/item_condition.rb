class ItemCondition < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: '新品、未使用' },
    { id: 3, category: '未使用に近い' },
    { id: 4, category: '目立った傷や汚れなし' },
    { id: 5, category: 'やや傷や汚れあり' },
    { id: 6, category: '傷や汚れあり' },
    { id: 7, category: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
