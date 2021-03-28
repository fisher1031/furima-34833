class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @first_name = @user.first_name
    @second_name = @user.second_name
    @first_name_kana = @user.first_name_kana
    @second_name_kana = @user.second_name_kana
    @birthday = @user.birthday
  end
end
