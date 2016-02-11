module NewsFeed
  class Document
    attr_reader :url, :dom

    def initialize(url, raw_xml)
      @url = url
      @dom = Nokogiri::XML(raw_xml)
    end

    def article_class
      @article_class ||= begin
        {
          /nytimes/ => NytimesArticle,
          /./ => Article, # default
        }.detect{|pattern, _| url =~ pattern }[1]
      end
    end

    def articles
      dom.css("channel item").map {|node| article_class.new(node) }
    end
  end
end
