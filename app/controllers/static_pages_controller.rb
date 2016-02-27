class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page params[:page]
      #user.rbで定義したfeed_itemsがそのユーザのフォローしている人のマイクロポストを
      #全て取得している。includes(:user)の部分はつぶやきに含まれるユーザ情報を予め先読み（プリロード）する処理を行うために用いる
      @user = current_user
    end
    

  end
  
end
