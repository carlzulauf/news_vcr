require "news_feed/fetcher"
require "news_feed/document"

module NewsFeed
  def self.get(url)
    Fetcher.new.get(url)
  end
end
