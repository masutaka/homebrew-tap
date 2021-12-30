class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.5'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.5/github-nippou_v4.1.5_darwin_amd64.zip'
  sha256 '3c2d3a44bf79e37fa2fad7db2529cc1f5b4f56fd90e5b5bdc5ddca50f8ebc1f1'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
