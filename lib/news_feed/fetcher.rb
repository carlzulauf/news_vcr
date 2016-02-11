module NewsFeed
  class Fetcher
    def fetch(url)
      response = get(url)
      Document.new(response.body) if response.success?
    end

    def get(url)
      Faraday.get(url)
    end
  end
end
