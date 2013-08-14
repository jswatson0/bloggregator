class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :published_at, :string, :summary, :title, :url, :author
  belongs_to :post

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    @entry = feed.entries
    feed.entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :title        => entry.title,
          :author       => entry.author,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id
        )
      end
    end
  end
end
