class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.7'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.7/github-nippou_v4.1.7_darwin_amd64.zip'
  sha256 'f96929d34b75f09699585865db8109944c1e97d75fb17c6004547e1eb995378a'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
