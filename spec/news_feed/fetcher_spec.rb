describe NewsFeed::Fetcher do
  describe "#get" do
    it "should return a success response" do
      expect(subject.get("http://www.rubyflow.com/rss")).to be_success
    end
  end
end
