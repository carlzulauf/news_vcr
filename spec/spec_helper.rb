require 'open-uri'

require 'bundler/setup'
Bundler.require(:default)

require 'news_feed'

VCR.configure do |c|
  c.hook_into :faraday
  c.cassette_library_dir = "cassettes"
end

# put global rspec stuff here
