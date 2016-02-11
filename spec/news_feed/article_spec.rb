describe NewsFeed::Article do
  context "from rubyflow" do
    let(:url) { "http://www.rubyflow.com/rss" }

    let(:doc) do
      VCR.use_cassette("rubyflow_articles") { NewsFeed.fetch(url) }
    end

    context "first" do
      subject { doc.articles.first }

      describe "title" do
        it "should equal first title taken manually from feed" do
          expect(subject.title).to eq(
            "Common problems (and solutions) when starting Docker with Rails"
          )
        end
      end

    end

  end
end
