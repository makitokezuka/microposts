
class MicropostsController < ApplicationController
before_action :logged_in_user, only: [:create]

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "micropost created"
            redirect_to root_url
        else
            ＠feed_items =current_user.feed_items.includes(:user).order(created_at: :desc)
            #10.2で追加。エラーが発生した場合にはstatic_pagesを利用するために先に読み込んでおく。
            render 'static_pages/home'
        end
    end
    
    def destroy
        @micropost = current_user.microposts.find.by(id: params[:id])
        return redirect_to root_url if @micropost.nil?
        @micropost.destroy
        flash[:success]="Micropost deleted"
        redirect_to request.referrer || root_url
    end

private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
    
end
