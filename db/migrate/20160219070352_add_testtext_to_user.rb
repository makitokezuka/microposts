class AddTesttextToUser < ActiveRecord::Migration
  def change
    add_column :users, :testtext, :integer
  end
end
