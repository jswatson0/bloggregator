class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, :user_id
  end
end
