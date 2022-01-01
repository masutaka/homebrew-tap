class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.6'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.6/github-nippou_v4.1.6_darwin_amd64.zip'
  sha256 '755c403b254206a0184bf9bba24a87a238e746ebad06101984c1db3f0436cd2f'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
