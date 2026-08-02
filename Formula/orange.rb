class Orange < Formula
  desc "Terminal reader for Hacker News"
  homepage "https://github.com/jonhadfield/orange"
  url "https://github.com/jonhadfield/orange/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9f3a8d14f8208c6ed57a58fb4ad6bd7f4def0e3c469df46f33f902ec0b3a7c74"
  license "MIT"
  head "https://github.com/jonhadfield/orange.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/orange"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orange --version")
  end
end
