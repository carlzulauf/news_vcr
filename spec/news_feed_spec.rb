describe NewsFeed do
  describe "module methods" do
    subject { NewsFeed }

    describe "fetch" do
      it "should respond to" do
        expect(subject.respond_to?(:fetch)).to eq(true)
      end

      it "should initialize a new fetcher" do
        fetcher = NewsFeed::Fetcher.new
        expect(NewsFeed::Fetcher).to receive(:new).and_return(fetcher)
        expect(fetcher).to receive(:fetch)
        subject.fetch("http://foo")
      end

      it "should return a document" do
        expect(subject.fetch("http://www.rubyflow.com/rss")).to \
          be_kind_of(NewsFeed::Document)
      end
    end
  end
end
