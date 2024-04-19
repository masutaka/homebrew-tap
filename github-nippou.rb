class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.16'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.16/github-nippou_v4.2.16_darwin_arm64.zip'
      sha256 '24f418d3bea64e9f5cd422ac0d6cc86fa60653485d7c021756ee08823fae20c2'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.16/github-nippou_v4.2.16_darwin_amd64.zip'
      sha256 '868569719ce099971eeb353bd8aa2591663bf2b3d8d3690cd8a85b0b7cfff684'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.16/github-nippou_v4.2.16_linux_arm64.zip'
      sha256 '50032001aa91330f096f818ce2b648fa0f2cba0810c6fd5765b66ca0dacb6a10'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.16/github-nippou_v4.2.16_linux_amd64.zip'
      sha256 'b8ec163d4a5fb4be23a6f4ab7bb487e8bfbf6b6ff1e49a006afb55bd7260faff'
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
