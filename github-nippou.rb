class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.0.4'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.4/github-nippou_v4.0.4_darwin_amd64.zip'
    sha256 'a8a187d8a50ef0452cba95b3c8e97b31319baa51d029448f8515c054d1f20f85'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.4/github-nippou_v4.0.4_darwin_386.zip'
    sha256 'ddb82a715cd6e07fad2e18a088c446d0608f41800c8326b4198bebb6cb0421b3'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
