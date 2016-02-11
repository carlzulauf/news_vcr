describe FeedFetcher do
  describe "class methods" do
    subject { FeedFetcher }

    describe "get" do
      it "should respond to" do
        expect(subject.respond_to?(:get)).to eq(true)
      end
    end
  end
end
