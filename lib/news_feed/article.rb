module NewsFeed
  class Article < Struct.new(:node)
    def title
      node.css("title").text
    end
  end
end
