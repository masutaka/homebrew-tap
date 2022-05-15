class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.8'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.8/github-nippou_v4.1.8_darwin_amd64.zip'
  sha256 '348310ad64273ae297bd59f0ae96f0ea4ca6a35a5eb856191ae9284049d3017f'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
