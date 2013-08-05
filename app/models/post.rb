class Post < ActiveRecord::Base
  attr_accessible :author, :date_posted, :preview, :title, :url

  has_many :favorites, :dependent => :destroy
end
