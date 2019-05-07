class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.0'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.0/github-nippou_v4.1.0_darwin_amd64.zip'
    sha256 '0a5e53a60556830851d2c194070771e52dc645a0fc8a1cf0da0836db8333659e'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.0/github-nippou_v4.1.0_darwin_386.zip'
    sha256 'f5f297af61a8ea9becae5dcc318d96dcda1413d1af3b61372441e3747f7f033e'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
