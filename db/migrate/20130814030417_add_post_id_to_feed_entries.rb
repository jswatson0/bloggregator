class AddPostIdToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :post_id, :integer
  end
end
