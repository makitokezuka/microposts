class FavoriteMicropostsController < ApplicationController
    def create
        @favorite_micropost = FavoriteMicropost.new(favorite_params)
        if @favorite_micropost.save
            flash[:success] ="お気に入りに登録しました。"
        else
            flash[:info]="失敗しました"
        end
        redirect_to root_path
    end
    
    def index
        @favorite_microposts = current_user.favorite_microposts
    end
    
    def destroy
        @favorite_micropost = current_user.favorite_microposts.find_by(params[:id])
        return redirect_to root_url if @favorite_micropost.nil?
        @favorite_micropost.destroy
        flash[:success]="Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
    private
    
    def favorite_params
        params.permit(:micropost_id, :user_id)
    end

end
