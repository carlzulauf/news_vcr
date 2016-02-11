module NewsFeed
  class Document
    attr_reader :url, :dom

    def initialize(url, raw_xml)
      @url = url
      @dom = Nokogiri::XML(raw_xml)
    end

    def articles
      dom.css("channel item").map {|node| Article.new(node) }
    end
  end
end
