describe NewsFeed::Document do
  context "with rubyflow document" do
    let(:url) { "http://www.rubyflow.com/rss" }

    subject do
      VCR.use_cassette("rubyflow") { NewsFeed.fetch(url) }
    end

    it "should have many articles" do
      expect(subject.articles.count).to be > 5
    end
  end
end
