class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
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
      flash[:danger] = '登録に失敗しました'
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
    @user.update(safe_user_params)
    
    flash[:success] = 'アカウントを更新しました'
    redirect_to @user
  end
  
  private
  
  def safe_user_params
    params.require(:user).permit(:name, :email, :sex, :birthday, :password, :password_confirmation)
  end
end
