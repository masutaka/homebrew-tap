class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.6'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.6/github-nippou_v4.2.6_darwin_arm64.zip'
      sha256 'b06c517b46b4a5371dee3c3e64f38388444638048aa116de9dcb0fcd04ae4577'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.6/github-nippou_v4.2.6_darwin_amd64.zip'
      sha256 '8ab02d63acdf7e6a5bceb29bc5b93f7d508fb515793bf07b61a10117e53ed595'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.6/github-nippou_v4.2.6_linux_amd64.zip'
      sha256 'e17f7bb870012a97c45feb28059ec8f62e85742142a95f64dcf1e3e04e297776'
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
