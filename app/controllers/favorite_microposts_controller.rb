class FavoriteMicropostsController < ApplicationController
    def create
        @favorite = Favoritemicropost.new(favorite_params)
    end
    
    private
        def favorite_params
        end
end
