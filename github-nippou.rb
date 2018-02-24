class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.0.3'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.3/github-nippou_v4.0.3_darwin_amd64.zip'
    sha256 '872ee9e3e34f3f8e317cb0dd75455050b7512fa16b7aaf7475b73356185fd267'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.3/github-nippou_v4.0.3_darwin_386.zip'
    sha256 '1e3738f6c7683e35a299649937841a912d2a297f048e1014c2d18e7cb16f989a'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
