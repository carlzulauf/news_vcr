describe NewsFeed::Fetcher do
  let(:url) { "http://www.rubyflow.com/rss" }
  describe "#get" do
    it "success response should return true to success?" do
      VCR.use_cassette("rubyflow") do
        expect(subject.get(url)).to be_success
      end
    end

    it "failure response should return false to success?" do
      VCR.use_cassette("rubyflow_bad") do
        expect(subject.get(url)).not_to be_success
      end
    end
  end
end
