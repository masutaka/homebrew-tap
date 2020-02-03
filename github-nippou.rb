class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.2'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.2/github-nippou_v4.1.2_darwin_amd64.zip'
    sha256 'b8ce9d99fc6e90ca036bdc00a218b1314652034aedafa47f1d51ef19331bc8b5'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.2/github-nippou_v4.1.2_darwin_386.zip'
    sha256 '970bce582933cfdc5fea82a0ed83e70de22d61b26736c3daf7a1cf103c6f379f'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
