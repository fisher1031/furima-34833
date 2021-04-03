require 'rails_helper'

RSpec.describe OrderDealing, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_dealing = FactoryBot.build(:order_dealing, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'postal_code・street_address_id・municipality・address・phone_numberがある場合登録できる' do
        expect(@order_dealing).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_dealing.building_name = ''
        expect(@order_dealing).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では登録できない' do
        @order_dealing.postal_code = ''  # postal_codeの値を空にする
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeには-が含まれていないと登録できない' do
        @order_dealing.postal_code = '1234567'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'street_address_idが空では登録できない' do
        @order_dealing.street_address_id = '' # street_address_idの値を空にする
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Street address can't be blank"
      end
      it 'street_address_idが1では登録できない' do
        @order_dealing.street_address_id = 1
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Street address must be other than 1'
      end
      it 'municipalityが空では登録できない' do
        @order_dealing.municipality = '' # municipalityの値を空にする
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では登録できない' do
        @order_dealing.address = '' # addressの値を空にする
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_dealing.phone_number = ''  # phone_numberの値を空にする
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは11文字以上の数値では登録できない' do
        @order_dealing.phone_number = '123456789123'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは半角英単語では登録できない' do
        @order_dealing.phone_number = 'aaaaaaaaaaa'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角数値では登録できない' do
        @order_dealing.phone_number = '１２３４５６７８９１２'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角ひらがなでは登録できない' do
        @order_dealing.phone_number = 'あいうえおあいうえおあ'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角カタカナでは登録できない' do
        @order_dealing.phone_number = 'アイウエオアイウエオア'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは全角漢字では登録できない' do
        @order_dealing.phone_number = '一二三四五六七八九一二'
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'tokenが空では登録できない' do
        @order_dealing.token = nil
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空では登録できない' do
        @order_dealing.user_id = ''
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では登録できない' do
        @order_dealing.item_id = ''
        @order_dealing.valid?
        expect(@order_dealing.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
