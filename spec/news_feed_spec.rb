describe NewsFeed do
  describe "module methods" do
    subject { NewsFeed }

    describe "get" do
      it "should respond to" do
        expect(subject.respond_to?(:get)).to eq(true)
      end

      it "should initialize a new fetcher" do
        expect(NewsFeed::Fetcher).to \
          receive(:new).and_return(NewsFeed::Fetcher.new)
        subject.get("http://foo")
      end

      it "should return a document" do
        expect(subject.get("http://www.rubyflow.com/rss")).to \
          be_kind_of(NewsFeed::Document)
      end
    end
  end
end
