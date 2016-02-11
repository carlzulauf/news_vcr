module NewsFeed
  class Fetcher
    def fetch(url)
      Document.new
    end

    def get(url)
      Faraday.get(url)
    end
  end
end
