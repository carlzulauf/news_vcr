describe "google" do
  it "should generate the cassette" do
    path = "cassettes/google.yml"
    File.unlink(path) if File.exist?(path)

    VCR.use_cassette("google") do
      Faraday.get("https://www.google.com/")
    end

    expect(File.exist?(path)).to eq(true)
  end
end
