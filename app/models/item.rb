class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, presence: true
    validates :image, presence: true
    validates :text, presence: true
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :street_address_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :street_address
  belongs_to :delivery_day
  has_one_attached :image
end
