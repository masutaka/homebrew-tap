class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.4'
  url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.4/github-nippou_v4.1.4_darwin_amd64.zip'
  sha256 '2bb53572bded55609ec3f1d80e75f4bf5877233fb02716e555538acfe18fc10a'

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
