class Post < ActiveRecord::Base
  attr_accessible :author, :date_posted, :preview, :title, :url, :published_at

  has_many :favorites, dependent: :destroy
  has_many :feed_entries
end
