class FavoriteMicropost < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :micropost, class_name: "Micropost"
  
  
  def favorite(favorite_micropost)
      FavoriteMicropost.find_or_create_by(micropost_id: favorite_micropost.id)
  end
end
