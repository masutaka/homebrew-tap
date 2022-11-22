class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.11'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.11/github-nippou_v4.1.11_darwin_amd64.zip'
  sha256 '2fee4c7ab15c3c55bd69e00eedd9c123b8986c7d05c88fc73c3eb7a238b2a991'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
