class AddTest2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :test2, :integer
  end
end
