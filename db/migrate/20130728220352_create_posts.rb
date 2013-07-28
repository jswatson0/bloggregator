class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :url
      t.text :preview
      t.date :date_posted

      t.timestamps
    end
  end
end
