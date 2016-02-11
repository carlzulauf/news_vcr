require "news_feed/article"
require "news_feed/document"
require "news_feed/fetcher"

module NewsFeed
  def self.fetch(url)
    Fetcher.new.fetch(url)
  end
end
