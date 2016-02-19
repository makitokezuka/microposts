class RemoveTesttextFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :testtext, :string
  end
end
