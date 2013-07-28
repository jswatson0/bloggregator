class Post < ActiveRecord::Base
  attr_accessible :author, :date_posted, :preview, :title, :url
end
