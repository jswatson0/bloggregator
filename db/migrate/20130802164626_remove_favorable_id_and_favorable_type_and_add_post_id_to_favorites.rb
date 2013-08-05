class RemoveFavorableIdAndFavorableTypeAndAddPostIdToFavorites < ActiveRecord::Migration
  def up
    remove_column :favorites, :favorable_id
    remove_column :favorites, :favorable_type
    add_column :favorites, :post_id, :integer
  end

  def down
    remove_column :favorites, :post_id
    add_column :favorites, :favorable_type, :string
    add_column :favorites, :favorable_id, :integer
  end
end
