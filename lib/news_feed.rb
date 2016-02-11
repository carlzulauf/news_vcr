require "news_feed/fetcher"
require "news_feed/document"

module NewsFeed
  def self.fetch(url)
    Fetcher.new.fetch(url)
  end
end
