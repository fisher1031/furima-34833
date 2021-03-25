class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :image, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 } 
  validates :item_condition_id , presence: true, numericality: { other_than: 1 } 
  validates :delivery_fee_id , presence: true, numericality: { other_than: 1 } 
  validates :delivery_day_id , presence: true, numericality: { other_than: 1 } 
  validates :street_address_id , presence: true, numericality: { other_than: 1 } 
  validates :price , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999999}

  belongs_to :category
  belongs_to :ItemCondition
  belongs_to :DeliveryFee
  belongs_to :StreetAddress
  belongs_to :DeliveryDay
  has_one_attached :image
end
