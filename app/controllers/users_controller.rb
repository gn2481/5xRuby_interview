class UsersController < ApplicationController
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: '會員註冊成功'
    else
      render :register
    end
  end

  def login
    @user = User.new
  end

  def sign_in
    user = User.login(user_params) # 認證

    if user
      sign_in_user(user)
      redirect_to root_path, notice: '成功登入！'
    else
      redirect_to login_users_path, notice: '請輸入正確帳號密碼'
    end
  end

  def logout
    sign_out_user
    redirect_to root_path, notice: '會員登出成功'
  end
  def edit

  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :comfirmation)
  end
  def user_login_params
    params.require(:user).permit(:email, :password)
  end

  def sign_in_user(u)
    session[:user_token] = u.id
  end

  def sign_out_user
    session[:user_token] = nil
  end
end
