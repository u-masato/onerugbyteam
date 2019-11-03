class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(safe_user_params)
    if @user.save
      flash[:success] = '登録しました'
      redirect_to root_url
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def destroy
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(safe_user_params)
      flash[:success] = 'アカウントを更新しました'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  private
  
  def safe_user_params
    params.require(:user).permit(:name, :email, :sex, :birthday, :password, :password_confirmation)
  end
  
  def require_user
    if current_user.id != params[:id].to_i
      redirect_to root_url
    end
  end
  
end
