require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録がうまくいくとき' do
      it 'nameとtext、category_idとitem_condition_id、delivery_fee_idとdelivery_day_id、street_address_id、priceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceは¥10,000,000以下であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'priceは¥300以上であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceは半角数字であれば登録できる' do
        @item.price = 9999
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''  # nameの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = '' # textの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = '' # category_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1 # category_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = '' # item_condition_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1 # item_condition_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item condition must be other than 1'
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = '' # delivery_fee_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it 'delivery_fee_idが1では登録できない' do
        @item.delivery_fee_id = 1 # delivery_fee_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee must be other than 1'
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = '' # delivery_day_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it 'delivery_day_idが1では登録できない' do
        @item.delivery_day_id = 1 # delivery_day_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery day must be other than 1'
      end
      it 'street_address_idが空では登録できない' do
        @item.street_address_id = '' # street_address_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Street address can't be blank"
      end
      it 'street_address_idが1では登録できない' do
        @item.street_address_id = 1 # street_address_idの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include 'Street address must be other than 1'
      end
      it 'imageが空では登録できない' do
        @item.image = nil # imageの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''  # priceの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが¥300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが¥9,999,999以上では登録できない' do
        @item.price = 10_000_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが全角(ひらがな)では登録できない' do
        @item.price = 'さんびゃくえん'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが全角(カタカナ)では登録できない' do
        @item.price = 'サンビャクエン'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが全角(漢字)では登録できない' do
        @item.price = '三百円'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが全角(数字)では登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角(英単語)では登録できない' do
        @item.price = 'money'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
