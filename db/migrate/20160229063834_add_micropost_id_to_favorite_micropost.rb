class AddMicropostIdToFavoriteMicropost < ActiveRecord::Migration
  def change
    add_column :favorite_microposts, :micropost_id, :integer
  end
end
