class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.10'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.10/github-nippou_v4.1.10_darwin_amd64.zip'
  sha256 'eebfa370310c5d5660cd2b06da4ceabb9a0e7122dd2a58743c9a0e3c801a84da'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
