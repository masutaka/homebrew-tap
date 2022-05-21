class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.9'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.9/github-nippou_v4.1.9_darwin_amd64.zip'
  sha256 '033e3065fb169ac4990b3410c5615941555c280e4ccf23e17b4f9f87d0ec7903'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
