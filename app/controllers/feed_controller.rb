class FeedController < ApplicationController

	require 'feedzirra'

	def index
		params[:per_page] ||= 10
    params[:page]     ||= 1

		@entry = FeedEntry.order("published_at DESC").page(params[:page].to_i).per_page(params[:per_page].to_i)
	end

end
