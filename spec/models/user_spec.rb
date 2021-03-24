require 'rails_helper'
RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end

 describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailは一意性でなければ登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailは@がなければ登録できない' do
      @user.email.delete!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordは半角英数字混合でなければ登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordとpassword_confirmationの値が一致していなければ登録できない' do
      @user.password = '000aaa'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''  # first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'second_nameが空では登録できない' do
      @user.second_name = ''  # second_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
    it 'first_nameは全角(漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.first_name = '山田だダ'
      expect(@user).to be_valid
    end
    it 'second_nameは全角(漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.second_name = '山田だダ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''  # first_name_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'second_name_kanaが空では登録できない' do
      @user.second_name_kana = ''  # second_name_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana can't be blank"
    end
    it 'first_name_kanaは全角(カタカナ)でなければ登録できない' do
      @user.first_name_kana = 'ヤマダ'
      expect(@user).to be_valid
    end
    it 'second_name_kanaは全角(カタカナ)でなければ登録できない' do
      @user.second_name_kana = 'リクタロウ'
      expect(@user).to be_valid
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''  # birthdayの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end