class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.0'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.0/github-nippou_v4.2.0_darwin_arm64.zip'
      sha256 'dc0047bb6af7bbe7d2600747009a84d7aec5b7f3c12ef48ebbabba579cec6762'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.0/github-nippou_v4.2.0_darwin_amd64.zip'
      sha256 '0b8a17d99106f1faab0a989d6460b1b6a865322c0c17315472f1428046ee01ca'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.0/github-nippou_v4.2.0_linux_amd64.zip'
      sha256 'eb09cd9b62f064760fbaba395176def890c2de621b73255515001e6141466eac'
    end
  end

  def install
    bin.install 'github-nippou'

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
    (bash_completion/'github-nippou').write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
    (fish_completion/'github-nippou.fish').write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
    (zsh_completion/'_github-nippou').write output
  end

  test do
    system 'github-nippou', 'version'
  end
end
