require 'bundler/setup'
Bundler.require(:default)

$LOAD_PATH.unshift File.join(File.expand_path(File.dirname(__FILE__)), "lib")
require "news_feed"

feeds = {
  "RubyFlow"        => "http://www.rubyflow.com/rss",
  "New York Times"  => "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"
}

puts "# News Reader 1.0!"
puts

feeds.each do |name, url|
  doc = NewsFeed.fetch(url)

  puts "## #{name}"
  puts
  puts "#{doc.articles.count} Stories Found"
  puts

  doc.articles.each do |article|
    puts "### #{article.title}"
    puts
    puts article.url
    puts
    puts article.description
    puts
  end

end
