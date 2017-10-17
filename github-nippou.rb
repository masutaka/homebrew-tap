class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.0.1'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.1/github-nippou_v4.0.1_darwin_amd64.zip'
    sha256 '4f428b01736f7feff0944b9b0ef077ac2415c628e4e157b2a8122c81a312363d'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.1/github-nippou_v4.0.1_darwin_386.zip'
    sha256 'a32fabf887bcd8148caaa8216b4904b02f4ba28abb9d132eef32bd30656719f3'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
