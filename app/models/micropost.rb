class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length:{maximum:140}
  paginates_per 5
  
  has_many :favorite_microposts, class_name:"FavoriteMicropost", foreign_key: "micropost_id", dependent: :destroy
  has_many :users, through: :favorite_microposts, source: :user
end
