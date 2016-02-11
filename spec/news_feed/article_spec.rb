describe NewsFeed::Article do
  context "from rubyflow" do
    let(:url) { "http://www.rubyflow.com/rss" }

    let(:doc) do
      VCR.use_cassette("rubyflow_articles") { NewsFeed.fetch(url) }
    end

    let(:articles) { doc.articles }

    context "first" do
      subject { articles.first }

      it "should have the correct title" do
        expect(subject.title).to eq(
          "Common problems (and solutions) when starting Docker with Rails"
        )
      end

      it "should have the correct url" do
        expect(subject.url).to eq(
          "http://www.rubyflow.com/p/2s38qm-common-problems-and-solutions-when-starting-docker-with-rails"
        )
      end

      it "should have the correct description" do
        expect(subject.description).to eq(
          " There are a lot of blog posts out there explaining how to get started with Docker. But in our recent experiments we’ve run into a couple of issues, so we’ve compiled a list of our encountered problems and their solutions on <a href=\"http://cookieshq.co.uk/posts/common-problems-when-starting-with-docker-and-rails/\">our latest post</a>. I hope it’s useful. "
        )
      end
    end

    it "should give you a console with articles if you uncomment line below" do
      # binding.pry
    end

  end
end
