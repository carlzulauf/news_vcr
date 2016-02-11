describe "google" do
  it "should load or create the cassette" do
    VCR.use_cassette("google") do
      Faraday.get("https://www.google.com/")
    end

    expect(File.exist?("cassettes/google.yml")).to eq(true)
  end
end
