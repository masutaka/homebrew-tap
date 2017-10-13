class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.0.0'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.0/github-nippou_darwin_amd64.gz'
    sha256 "8b2fad1afd5c2a59965410866fad37e84c2d523c77a92c4102470f4712f1f829"
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.0/github-nippou_darwin_386.gz'
    sha256 "4d9c93f726e7df43bf70ee7dbbf550dff5b9268de0ab7c4eb9e9f47c47c6a774"
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
