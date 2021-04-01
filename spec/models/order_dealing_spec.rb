require 'rails_helper'

RSpec.describe OrderDealing, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_dealing = FactoryBot.build(:order_dealing, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号がある場合登録できる' do
        expect(@order_dealing).to be_valid
      end
    end
end
end
