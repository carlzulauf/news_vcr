RSpec.shared_examples "documents" do
  it "should have many articles" do
    expect(subject.articles.count).to be > 5
  end

  it "should return Article instances" do
    expect(subject.articles.first).to be_kind_of(NewsFeed::Article)
  end
end

describe NewsFeed::Document do
  context "with rubyflow document" do
    let(:url) { "http://www.rubyflow.com/rss" }

    subject do
      VCR.use_cassette("rubyflow") { NewsFeed.fetch(url) }
    end

    include_examples "documents"
  end

  context "with nytimes document" do
    let(:url) { "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" }

    subject do
      VCR.use_cassette("nytimes") { NewsFeed.fetch(url) }
    end

    include_examples "documents"
  end
end
