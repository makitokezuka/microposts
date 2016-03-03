class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :collect_user, only:[:edit,:update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page params[:page]
    @users = @user.following_users
  end  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] ="Welcome to the Sample App! #{logged_in?}"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to user_path
      flash[:info] = "プロフィールを変更しました"
    else
      #保存に失敗した場合は編集画面にもどす
      render 'edit'
    end
  end
  
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
    
  end
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
    
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :country)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def collect_user
    if @user == current_user
    else
      flash[:info] = "権限がありません"
      @user = current_user
      redirect_to user_path(@user)
    end
    
  end
  
  
end
