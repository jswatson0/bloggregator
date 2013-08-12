class Favorite < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :user_id, :post_id
  #validates_presence_of :user_id, :post_id

  before_save :associate_user

  # Protected Methods
  def associate_user
  	unless self.user_id
  		return self.user_id = session[:user_id] if session[:user_id]
  		return false
  	end
  end
end
