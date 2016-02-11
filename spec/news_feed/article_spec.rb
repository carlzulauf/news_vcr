describe NewsFeed::Article do
  let(:articles) { doc.articles }

  context "from rubyflow" do
    let(:url) { "http://www.rubyflow.com/rss" }

    let(:doc) do
      VCR.use_cassette("rubyflow_articles") { NewsFeed.fetch(url) }
    end

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
          "There are a lot of blog posts out there explaining how to get "+
          "started with Docker. But in our recent experiments we’ve run into "+
          "a couple of issues, so we’ve compiled a list of our encountered "+
          "problems and their solutions on "+
          "[our latest post](http://cookieshq.co.uk/posts/common-problems-when-starting-with-docker-and-rails/). "+
          "I hope it’s useful."
        )
      end
    end

    it "should give you a console with articles if you uncomment line below" do
      # binding.pry
    end

  end

  context "from nytimes" do
    let(:url) { "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" }

    let(:doc) do
      VCR.use_cassette("nytimes_articles") { NewsFeed.fetch(url) }
    end

    context "first" do
      subject { articles.first }

      it "should have the correct title" do
        expect(subject.title).to eq(
          "New York Today: New York Today: Where to Eat Alone"
        )
      end

      it "should have the correct url" do
        expect(subject.url).to eq(
          "http://www.nytimes.com/2016/02/11/nyregion/new-york-today-where-to-eat-alone.html?partner=rss&emc=rss"
        )
      end
    end
  end
end
