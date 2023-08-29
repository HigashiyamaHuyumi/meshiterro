class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(@user) #ユーザーの詳細ページへのパス
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end