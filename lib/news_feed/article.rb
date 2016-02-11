module NewsFeed
  class Article < Struct.new(:node)
    def title
      node.css("title").text
    end

    def url
      node.css("link").text
    end

    def description
      node.css("description").text
    end
  end
end
