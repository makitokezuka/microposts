class FavoriteMicropostsController < ApplicationController
    def create
        @favorite_micropost = Micropost.new(favorite_params)
        
        #@favorite_micropost = Micropost.find(params[:id])
        #favorite(@favorite_micropost)
    end
    
    def index
        @favorite_microposts = FavoriteMicropost.all
    end
    
    private
    
    def favorite_params
        params.require(:microposts).permit(:micropost_id)
    end

end
