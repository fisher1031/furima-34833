require 'rails_helper'
RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end

 describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it "nicknameとemail、passwordとpassword_confirmation、first_nameとsecond_name、first_name_kanaとsecond_name_kana、birthdayが存在すれば登録できる" do
      @user.nickname = 'ニックネーム'
      @user.email = 'test@testertester.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.first_name = '山田'
      @user.second_name = '隆太郎'
      @user.first_name_kana = 'ヤマダ'
      @user.second_name_kana = 'リュウタロウ'
      @user.birthday = '1994-10-31'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが一致し、かつ6文字以上の半角英数字混合であれば登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
    it 'first_nameは全角(漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.first_name = '山田だダ'
      expect(@user).to be_valid
    end
    it 'second_nameは全角(漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.second_name = '山田だダ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaは全角(カタカナ)であれば登録できる' do
      @user.first_name_kana = 'ヤマダ'
      expect(@user).to be_valid
    end
    it 'second_name_kanaは全角(カタカナ)であれば登録できる' do
      @user.second_name_kana = 'リクタロウ'
      expect(@user).to be_valid
    end
  end


  context '新規登録がうまくいかないとき' do
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
    it 'passwordは6文字以下では登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角英語だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordが全角では登録できない' do
      @user.password = 'これはテスト'
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

    it 'first_nameは半角英単語であれば登録できない' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'first_nameは半角数字であれば登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'second_nameは半角英単語であれば登録できない' do
      @user.second_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name is invalid"
    end
    it 'second_nameは半角数字であれば登録できない' do
      @user.second_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name is invalid"
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
    it 'first_name_kanaは全角(ひらがな)であれば登録できない' do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'second_name_kanaは全角(ひらがな)であれば登録できない' do
      @user.second_name_kana = 'りくたろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana is invalid"
    end

    it 'first_name_kanaは全角(漢字)であれば登録できない' do
      @user.first_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'second_name_kanaは全角(漢字)であれば登録できない' do
      @user.second_name_kana = '隆太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana is invalid"
    end

    it 'first_name_kanaは半角(英単語)であれば登録できない' do
      @user.first_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'second_name_kanaは半角(英単語)であれば登録できない' do
      @user.second_name_kana = 'rikutarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana is invalid"
    end
    it 'first_name_kanaは半角(数字)であれば登録できない' do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'second_name_kanaは半角(数字)であれば登録できない' do
      @user.second_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana is invalid"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''  # birthdayの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
end