class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    # editアクションはビューファイルを表示するだけなので、アクションの定義のみになる
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :family_name, :first_name)
  end
end
