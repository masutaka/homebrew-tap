class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.0.2'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.2/github-nippou_v4.0.2_darwin_amd64.zip'
    sha256 'f26c439e84d32708e1d51d5e9dc64bbe5291be85c75ddf48630e5fded0743511'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.0.2/github-nippou_v4.0.2_darwin_386.zip'
    sha256 '37b04c94aa6f9e264359c6ff4f36eedb206f3d9246d2988b39f65be2eb76043c'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
