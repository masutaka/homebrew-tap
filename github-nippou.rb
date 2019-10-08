class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.1'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.1/github-nippou_v4.1.1_darwin_amd64.zip'
    sha256 '05c94cf4c10d507e9766549eb39b918c40d3f4f5e647f6adf63344739874c66b'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.1/github-nippou_v4.1.1_darwin_386.zip'
    sha256 '2b3e064bd87de97dce2464e0336e42372dfddfae70a7231737ca3f5793f8e66d'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
