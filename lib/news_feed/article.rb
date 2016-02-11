module NewsFeed
  class Article < Struct.new(:node)
    def title
      node.css("title").text
    end

    def url
      node.css("link").text
    end

    def description
      html = node.css("description").text.strip

      doc = Nokogiri::HTML(html)

      # Replace inside of <a> tags with markdown
      doc.css("a").each do |a|
        a.inner_html = "[#{a.text}](#{a[:href]})"
      end

      # Strip all tags
      doc.content
    end
  end
end
