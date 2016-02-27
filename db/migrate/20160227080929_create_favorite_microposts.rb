class CreateFavoriteMicroposts < ActiveRecord::Migration
  def change
    create_table :favorite_microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
