class FeedsController < ApplicationController

  require 'feedzirra'

  def index
    params[:per_page] ||= 10
    params[:page]     ||= 1

    @entries = FeedEntry.order("published_at DESC").page(params[:page].to_i).per_page(params[:per_page].to_i)
  end

  def publish
    @entry = FeedEntry.find(params[:id])
    post = Post.new
    post.title        = @entry.title
    post.author       = @entry.author
    post.url          = @entry.url
    post.published_at = @entry.published_at
    post.preview      = @entry.summary
    post.date_posted  = Date.today
    post.save

    post.reload
    @entry.post_id = post.id
    @entry.save

    respond_to do |format|
      format.js
    end
  end

end
