require 'bundler/setup'
Bundler.require(:default)

require 'news_feed'

VCR.configure do |c|
  c.hook_into :faraday
  c.cassette_library_dir = "cassettes"
  c.allow_http_connections_when_no_cassette = true
end
