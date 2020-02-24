class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.3'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.3/github-nippou_v4.1.3_darwin_amd64.zip'
    sha256 'e5bbf62bd7eb80b84831db30ea6c9ea22e17d5a1e8a4eac99bcbdf53feacf70d'
  else
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.3/github-nippou_v4.1.3_darwin_386.zip'
    sha256 'faeb918326ed839c407fa26ae0032ca8ece16ac4ae8ac8aba09d0492bf94462f'
  end

  def install
    bin.install 'github-nippou'
  end

  test do
    system 'github-nippou', 'version'
  end
end
