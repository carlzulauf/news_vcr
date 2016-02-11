module NewsFeed
  class Article < Struct.new(:node)
    def title
      node.css("title").text
    end

    def url
      node.children.each do |child|
        if child.name == "link"
          if child.namespace&.prefix == "atom"
            return child["href"]
          else
            return child.text
          end
        end
      end
      nil
    end

    def description_html
      node.css("description").text.strip
    end

    def description
      doc = Nokogiri::HTML(description_html)

      # Replace inside of <a> tags with markdown
      doc.css("a").each do |a|
        a.inner_html = "[#{a.text}](#{a[:href]})"
      end

      # Strip all tags
      doc.content
    end
  end

  class NytimesArticle < Article
    def description_html
      super.split("<br clear='all'/>").first
    end
  end
end
