class AddPostsUsersTable < ActiveRecord::Migration
  

  def self.up
  	create_table :posts_users, :id => false do |t|
  		t.references :posts 
  		t.references :users 
  		
  	end
  end

  def self.down
  	drop_table :topics_users
  end
end
